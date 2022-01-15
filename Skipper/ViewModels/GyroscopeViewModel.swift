//
//  GyroscopeViewModel.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import CoreMotion
import UIKit

class GyroscopeViewModel {
  let motion = CMMotionManager()
  
  var appState: AppState
  
  var timer: Timer?
  
  init(_ state: AppState) {
    self.appState = state
  }
  
  deinit {
    stopGyros()
  }
  
  func startGyros() {
     if motion.isGyroAvailable {
       let interval = 0.1 // seconds
       self.motion.deviceMotionUpdateInterval = interval
       self.motion.startDeviceMotionUpdates(using: .xArbitraryZVertical)

        self.timer = Timer(fire: Date(), interval: interval,
               repeats: true, block: { (timer) in
           if let data = self.motion.deviceMotion {
             let heel = data.attitude.roll // radians
             let pitch = data.attitude.pitch // radians
             self.appState.gyro.heel = heel * 180 / Double.pi // degrees
             self.appState.gyro.pitch = pitch * 180 / Double.pi // degrees
           }
        })

       RunLoop.current.add(self.timer!, forMode: .default)
     }
  }

  func stopGyros() {
     if self.timer != nil {
        self.timer?.invalidate()
        self.timer = nil

        self.motion.stopDeviceMotionUpdates()
     }
  }
}
