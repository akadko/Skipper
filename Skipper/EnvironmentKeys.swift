//
//  EnvironmentKeys.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import SwiftUI

struct GyroscopeViewModelKey: EnvironmentKey {
  static let defaultValue = GyroscopeViewModel(AppState())
}

struct TrackingViewModelKey: EnvironmentKey {
  static let defaultValue = TrackingViewModel(AppState())
}

extension EnvironmentValues {
  var gyroscopeViewModel: GyroscopeViewModel {
    get { self[GyroscopeViewModelKey.self] }
    set { self[GyroscopeViewModelKey.self] = newValue }
  }
  var trackingViewModel: TrackingViewModel {
    get { self[TrackingViewModelKey.self] }
    set { self[TrackingViewModelKey.self] = newValue }
  }
}
