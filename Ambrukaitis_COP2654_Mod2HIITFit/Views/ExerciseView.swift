//
//  ExerciseView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct ExerciseView: View {
    //index variable for the exercise name arrays
    let index: Int
    
    var exercise: Exercise {
        Exercise.exercises[index]
    }
    
    let interval: TimeInterval = 30
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                //header
                HeaderView(exerciseName: exercise.exerciseName)
                    .padding(.bottom)
                
                //video player
                VideoPlayerView(videoName: exercise.videoName)
                    .frame(height: geometry.size.height * 0.45)
                
                //timer
                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                
                //start/done button
                Button("Start/Done") {}
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
    ExerciseView(index: 0)
}


