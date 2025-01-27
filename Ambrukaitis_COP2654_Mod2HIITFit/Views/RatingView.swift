//
//  RatingView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    let maximumRating: Int = 5
    
    let onColor = Color.red
    let offColor = Color.gray
    
    var body: some View {
        //creates the rating look, made of five ecg icons
        HStack {
            ForEach(1 ..< maximumRating + 1, id: \.self) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
        .font(.largeTitle)
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
