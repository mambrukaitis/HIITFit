//
//  ContainerView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 2/2/25.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30.0)
                .foregroundColor(Color("background"))
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundColor(Color("background"))
            }
            content
        }
    }
}

#Preview {
    ContainerView {
        VStack {
            RaisedButton(buttonText: "Hello World") {}
                .padding(50)
            Button("Tap me!") {}
                .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
    .padding(50)
}
