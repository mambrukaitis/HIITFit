//
//  ExerciseView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State var showHistory: Bool = false
    @State private var showSuccess: Bool = false
    @EnvironmentObject var history: HistoryStore
    //index variable for the exercise name arrays
    let index: Int
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    //tests if this is the last exercise
    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }
    
    //start and done button functionality
    var startButton: some View {
        Button("Start Exercise") {
            showTimer.toggle()
        }
    }
    var doneButton: some View {
        Button("Done") {
            timerDone = false
            showTimer.toggle()
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
            history.addDoneExercise(Exercise.exercises[index].exerciseName)
        }
    }
    
    @State private var timerDone = false
    @State private var showTimer = false
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                
                //header
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: Exercise.exercises[index].exerciseName
                )
                .padding(.bottom)
                
                //video player
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                //done button
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()
                
                //timer
                if showTimer {
                    TimerView(
                        timerDone: $timerDone,
                        size: geometry.size.height * 0.07
                        )
                }
                Spacer()
                
                //rating
                RatingView(exerciseIndex: index)
                    .padding()
                
                //history button
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(0), index: 0)
        .environmentObject(HistoryStore())
}


