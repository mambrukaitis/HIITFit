//
//  Ambrukaitis_COP2654_Mod2HIITFitApp.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

@main
struct Ambrukaitis_COP2654_Mod2HIITFitApp: App {
    @StateObject private var historyStore = HistoryStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    print(URL.documentsDirectory)
                }
                .environmentObject(historyStore)
                .alert(isPresented: $historyStore.loadingError) {
                    Alert(
                        title: Text("History"),
                        message: Text(
                            """
                            Unfortunately we can't load your past history.
                            Email support:
                            support@xyz.com
                            """))
                }
        }
    }
}
