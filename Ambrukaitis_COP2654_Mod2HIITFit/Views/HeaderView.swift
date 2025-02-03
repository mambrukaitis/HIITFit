//
//  HeaderView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int
    let titleText: String
    
    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    ZStack {
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.white)
                            .opacity(index == selectedTab ? 0.5 : 0)
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        selectedTab = index
                    }
                }
            }
            .font(.title2)
        }
    }
}

#Preview {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
}
