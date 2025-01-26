//
//  ExerciseView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct ExerciseView: View {
    //arrays for the exercise video names
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    
    let index: Int
    
    var body: some View {
        Text(exerciseNames[index])
    }
}

#Preview {
    ExerciseView(index: 0)
}
