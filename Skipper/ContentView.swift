//
//  ContentView.swift
//  Skipper
//
//  Created by akadko Akadko on 15.01.2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
      VStack {
        TrackMap()
        GyroscopeInfo()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
