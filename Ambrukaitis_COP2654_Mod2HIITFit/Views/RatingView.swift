//
//  RatingView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int
    @AppStorage("ratings") var ratings = ""
    @State private var rating = 0
    let maximumRating: Int = 5
    
    let onColor = Color.red
    let offColor = Color.gray
    
    //ensures taht the number of possible ratings is the number of exercises
    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desiredLength = Exercise.exercises.count
        if ratings.count < desiredLength {
            ratings = ratings.padding(
                toLength: desiredLength,
                withPad: "0",
                startingAt: 0)
        }
    }
    
    //updates the @AppStorage string for ratings
    func updateRating(index: Int) {
        rating = index
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        ratings.replaceSubrange(index...index, with: String(rating))
    }
    
    fileprivate func convertRating() {
        let index = ratings.index(
            ratings.startIndex,
            offsetBy: exerciseIndex)
        let character = ratings[index]
        rating = character.wholeNumberValue ?? 0
    }
    
    var body: some View {
        //creates the rating look, made of five ecg icons
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {
                        updateRating(index: index)
                    }
                    .onAppear {
                        convertRating()
                    }
                    .onChange(of: ratings) {
                        convertRating()
                    }
            }
        }
        .font(.largeTitle)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @AppStorage("ratings") private var ratings: String?
        
        var body: some View {
            ratings = nil
            return RatingView(exerciseIndex: 0)
        }
    }
    
    return PreviewWrapper()
}
