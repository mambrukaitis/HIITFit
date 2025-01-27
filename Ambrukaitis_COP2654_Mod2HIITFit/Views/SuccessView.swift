//
//  SuccessView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTab: Int
    var body: some View {
        ZStack {
            VStack{
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                    .padding()
                Text("High Five!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Good job completing all four exercises!")
                    .foregroundColor(.gray)
                Text("Remember tomorrow's another day.")
                    .foregroundColor(.gray)
                Text("So eat well and get some rest.")
                    .foregroundColor(.gray)
            }
            VStack {
                Spacer()
                Button("Continue") {
                    selectedTab = 9
                    dismiss()
                }
                    .padding()
            }
        }
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
}
