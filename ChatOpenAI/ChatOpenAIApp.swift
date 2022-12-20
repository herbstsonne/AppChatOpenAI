//
//  ChatOpenAIApp.swift
//  ChatOpenAI
//
//  Created by Miriam Pfaffenbach on 18.12.22.
//

import SwiftUI

@main
struct ChatOpenAIApp: App {
  
  init() {
    APICaller.shared.setup()
  }
  var body: some Scene {
      WindowGroup {
          ContentView()
      }
  }
}
