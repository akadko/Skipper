//
//  SkipperApp.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import SwiftUI

@main
struct SkipperApp: App {
  let appState = AppState()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(appState)
        .environment(\.gyroscopeViewModel, GyroscopeViewModel(appState))
    }
  }
}
