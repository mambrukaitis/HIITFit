//
//  ContentView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(0..<4) { number in
                ExerciseView(index: number)}
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}

