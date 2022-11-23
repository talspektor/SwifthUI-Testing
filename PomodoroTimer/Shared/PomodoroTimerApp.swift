//
//  PomodoroTimerApp.swift
//  Shared
//
//  Created by Tal Spektor on 25/08/2022.
//

import SwiftUI

@main
struct PomodoroTimerApp: App {
    // MARK: Since we're doing background fetching intializing here
    @StateObject var pomodoroModel: PomodoroModel = .init()
    // MARK: Scene phase
    @Environment(\.scenePhase) var phase
    // MARK: Storing last time stamp
    @State var lasActiveTimeStamp: Date = Date()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        .onChange(of: phase) { newValue in
            if pomodoroModel.isStarted {
                if newValue == .background {
                    lasActiveTimeStamp = Date()
                }
                
                if newValue == .active {
                    // MARK: Finding the difference
                    let currentTimeStampDiff = Date().timeIntervalSince(lasActiveTimeStamp)
                    if pomodoroModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                        pomodoroModel.isStarted = false
                        pomodoroModel.totalSeconds = 0
                        pomodoroModel.isFinished = true
                    } else {
                        pomodoroModel.totalSeconds -= Int(currentTimeStampDiff)
                    }
                        
                }
            }
        }
    }
}
