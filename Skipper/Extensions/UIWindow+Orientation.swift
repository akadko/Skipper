//
//  UIWindow+Orientation.swift
//  Skipper
//
//  Created by akadko Akadko on 16.01.2022.
//

import Foundation
import UIKit

extension UIWindow {
  static var isLandscape: Bool {
    if #available(iOS 13.0, *) {
      return UIApplication.shared.windows
        .first?
        .windowScene?
        .interfaceOrientation
        .isLandscape ?? false
    } else {
      return UIApplication.shared.statusBarOrientation.isLandscape
    }
  }
}
