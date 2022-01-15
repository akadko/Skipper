//
//  GyroscopeInfo.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import SwiftUI

struct GyroscopeInfo: View {
  
  @EnvironmentObject var appState: AppState
  @Environment(\.gyroscopeViewModel) var gyroViewModel: GyroscopeViewModel
  
  var body: some View {
    HStack {
      Card(key: "Heel", value: "\(round(self.appState.gyro.heel))°")
      Card(key: "Pitch", value: "\(round(self.appState.gyro.pitch))°")
    }
    .padding(.top, 16)
    .onAppear {
      self.gyroViewModel.startGyros()
    }
  }
}
