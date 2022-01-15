//
//  AppState.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation

class AppState: ObservableObject {
  @Published var gyro = GyroscopeState()
  @Published var tracking = TrackingState()
}
