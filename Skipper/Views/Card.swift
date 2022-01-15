//
//  Card.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import Foundation
import SwiftUI

struct Card: View {
  let key: String
  let value: String
  var body: some View {
    VStack {
      Text(key).colorInvert()
      Text(value).font(.largeTitle).fontWeight(.bold).colorInvert()
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.blue)
    .cornerRadius(4)
  }
}
