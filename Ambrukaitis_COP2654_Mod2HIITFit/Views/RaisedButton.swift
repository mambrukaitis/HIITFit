//
//  RaisedButton.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 2/2/25.
//

import SwiftUI

struct RaisedButton: View {
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(buttonText)
                .raisedButtonStyle()
        })
        .buttonStyle(.raised)
    }
}

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 12)
            .background(
                Capsule()
                    .foregroundColor(Color("background"))
                    .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
                    .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
            )
    }
}

extension Text {
    func raisedButtonStyle() -> some View {
        self
        .font(.body)
        .fontWeight(.bold)
    }
}

extension ButtonStyle where Self == RaisedButtonStyle {
    static var raised: RaisedButtonStyle {
        .init()
    }
}

#Preview {
    ZStack {
        RaisedButton(buttonText: "Get Started") {
            print("Hello World")
        }
            .padding(20)
            .buttonStyle(.raised)
    }
    .background(Color("background"))
}
