//
//  WetherNowApp.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import SDWebImage
import SDWebImageSVGCoder
import SwiftUI

@main
struct WetherNowApp: App {
  @State private var modelData = ModelData()
  init() {
    SDImageCodersManager.shared.addCoder(SDImageSVGCoder.shared)
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(modelData)
    }
  }
}
