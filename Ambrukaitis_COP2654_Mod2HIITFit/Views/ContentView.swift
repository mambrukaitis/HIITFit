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
            Text("Welcome")
            Text("Exercise 1")
            Text("Exercise 2")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(
            PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

#Preview {
    ContentView()
}

