//
//  ExerciseView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int
    @State private var rating = 0
    @State var showHistory: Bool = false
    @State private var showSuccess: Bool = false
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
        Button("Start Exercise") {}
    }
    var doneButton: some View {
        Button("Done") {
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }
    
    let interval: TimeInterval = 30
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                //header
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: Exercise.exercises[index].exerciseName
                )
                .padding(.bottom)
                
                //video player
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                //timer
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                
                //done button
                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .sheet(isPresented: $showSuccess) {
                            SuccessView(selectedTab: $selectedTab)
                                .presentationDetents([.medium, .large])
                        }
                }
                .font(.title3)
                .padding()
                
                //rating
                RatingView(rating: $rating)
                    .padding()
                
                //history button
                Spacer()
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
    ExerciseView(selectedTab: .constant(1), index: 3)
}


