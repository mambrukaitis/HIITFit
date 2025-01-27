//
//  ExerciseView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var selectedTab: Int
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
            selectedTab = lastExercise ? 9 : selectedTab + 1
        }
    }
    
    let interval: TimeInterval = 30
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                //header
                HeaderView(titleText: exercise.exerciseName)
                    .padding(.bottom)
                
                //video player
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                //timer
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                
                //start/done button
                HStack(spacing: 150) {
                    startButton
                    doneButton
                }
                .font(.title3)
                .padding()
                
                //rating
                RatingView()
                    .padding()
                
                //history button
                Spacer()
                Button("History") {}
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(selectedTab: .constant(1), index: 1)
}


