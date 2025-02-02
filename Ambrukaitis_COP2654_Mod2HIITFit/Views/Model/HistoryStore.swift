//
//  HistoryStore.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []
    @Published var loadingError = false
    var dataURL: URL {
        URL.documentsDirectory.appendingPathComponent("history.plist")
    }
    
    init() {
        #if DEBUG
    //    createDevData()
        #endif
        do {
            try load()
        } catch {
            loadingError = true
        }
    }
    
    enum FileError: Error {
        case loadFailure
        case saveFailure
    }
    
    func load() throws {
        guard let data = try? Data(contentsOf: dataURL) else {
            return
        }
        do {
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)
            let convertedPlistData = plistData as? [[Any]] ?? []
            
            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? [])
            }
        } catch {
            throw FileError.loadFailure
        }
    }
    
    //once done is pressed after an exercise is completed, it is added to the history
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
            exerciseDays[0].exercises.append(exerciseName)
        } else {
            exerciseDays.insert(
                ExerciseDay(date: today, exercises: [exerciseName]), at: 0)
        }
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func save() throws {
        let plistData = exerciseDays.map {
            [$0.id.uuidString, $0.date, $0.exercises]
        }
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)
            
            try data.write(to: dataURL, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
}
