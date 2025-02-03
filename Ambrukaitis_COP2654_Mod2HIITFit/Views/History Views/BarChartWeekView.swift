//
//  BarChartWeekView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 2/2/25.
//

import SwiftUI
import Charts

struct BarChartWeekView: View {
    @EnvironmentObject var history: HistoryStore
    @State private var weekData: [ExerciseDay] = []
    @State private var isBarChart: Bool = true
    
    var body: some View {
        VStack {
            Text("History for Last Week")
                .font(.title)
                .padding()
            if isBarChart {
                Chart(weekData) { day in
                    ForEach(Exercise.names, id: \.self) { name in
                        BarMark(
                            x: .value("Date", day.date, unit: .day),
                            y: .value("Total Count", day.countExercises(exercise: name)))
                        .foregroundStyle(by: .value("Exercise", name))
                    }
                }
                .padding()
                .chartForegroundStyleScale([
                    "Burpee": Color("chart-burpee"),
                    "Squat": Color("chart-squat"),
                    "Step Up": Color("chart-step-up"),
                    "Sun Salute": Color("chart-sun-salute")
                ])
            } else {
                Chart(weekData) { day in
                    LineMark(
                        x: .value("Date", day.date, unit: .day),
                        y: .value("Total Count", day.exercises.count))
                    .symbol(.circle)
                    .interpolationMethod(.catmullRom)
                }
                .padding()
            }
            Toggle("Bar Chart", isOn: $isBarChart)
                .padding()
        }
        //looks through seven days, if no exercise performed on a day, makes an empty record for that day
        .onAppear {
            let firstDate = history.exerciseDays.first?.date ?? Date()
            let dates = firstDate.previousSevenDays
            weekData = dates.map { date in
                history.exerciseDays.first(
                    where: { $0.date.isSameDay(as: date) }) ?? ExerciseDay(date: date)
            }
        }
    }
}

#Preview {
    BarChartWeekView()
        .environmentObject(HistoryStore(preview: true))
}
