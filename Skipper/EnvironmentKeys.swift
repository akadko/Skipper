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

extension EnvironmentValues {
  var gyroscopeViewModel: GyroscopeViewModel {
    get { self[GyroscopeViewModelKey.self] }
    set { self[GyroscopeViewModelKey.self] = newValue }
  }
}
