//
//  WelcomeView.swift
//  Ambrukaitis_COP2654_Mod2HIITFit
//
//  Created by Matas Ambrukaitis on 1/26/25.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var HistoryStore: HistoryStore
    @Binding var selectedTab: Int
    @State private var showHistory: Bool = false
    @State private var showReports = false
    
    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }
        .padding()
    }
    
    var historyButton: some View {
        Button(
            action: {
                showHistory = true
            }, label: {
                Text("History")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            })
            .padding(.bottom, 10)
            .buttonStyle(EmbossedButtonStyle())
    }
    
    var reportsButton: some View {
        Button(
            action: {
                showReports = true
            }, label: {
                Text("Reports")
                    .fontWeight(.bold)
                    .padding([.leading, .trailing], 5)
            })
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
    
    var buttonHStack: some View {
        HStack(spacing: 40) {
            historyButton
            reportsButton
        }
        .padding(10)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome")
                Spacer()
                
                ContainerView {
                    ViewThatFits {
                        VStack {
                            WelcomeView.images
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            buttonHStack
                        }
                        VStack {
                            WelcomeView.welcomeText
                            getStartedButton
                            Spacer()
                            buttonHStack
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
            .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
            }
            .sheet(isPresented: $showReports) {
                BarChartWeekView()
            }
        }
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
