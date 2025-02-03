//
//  AddHistory.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 2/2/25.
//

import SwiftUI

struct AddHistory: View {
    @Binding var addMode: Bool
    @State private var exerciseDate = Date()
    
    var body: some View {
        VStack {
            ZStack {
                Text("Add Exercise")
                    .font(.title)
                Button("Done") {
                    addMode = false
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ButtonsView(date: $exerciseDate)
            DatePicker(
                "choose Date",
                selection: $exerciseDate,
                in: ...Date(),
                displayedComponents: .date)
            .datePickerStyle(.graphical)
        }
        .padding()
    }
}

//when button pressed, it adds it to the history
struct ButtonsView: View {
    @EnvironmentObject var history: HistoryStore
    @Binding var date: Date
    
    var body: some View {
        HStack {
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                let exerciseName = Exercise.exercises[index].exerciseName
                Button(exerciseName) {
                    history.addExercise(date: date, exerciseName: exerciseName)
                }
            }
        }
        .buttonStyle(EmbossedButtonStyle(buttonScale: 1.5))
    }
}

#Preview {
    AddHistory(addMode: .constant(true))
        .environmentObject(HistoryStore(preview: true))
}
