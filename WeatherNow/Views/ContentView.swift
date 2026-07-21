//
//  ContentView.swift
//  WeatherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import SwiftUI

struct ContentView: View {
  @Environment(ModelData.self) var modelData
  @State private var isShowFavoriteOnly = false

  var filteredAreas: [Area] {
    modelData.areas.filter { area in
      !isShowFavoriteOnly || area.isFavorite
    }
  }

  var body: some View {
    NavigationStack {
      List(filteredAreas) { area in
        NavigationLink(value: area) {
          AreaRow(area: area)
        }
      }
      .animation(.default, value: filteredAreas)
      .navigationTitle("")
      .toolbar {
        ToolbarItem(placement: .principal) {
          HStack(spacing: 8) {
            Image(systemName: "cloud.sun.rain")
              .symbolRenderingMode(.palette)
              .foregroundStyle(.blue, .red, .cyan)
            Text("天気を見る")
              .font(.title)
          }.padding(.top, 30)
        }
        ToolbarItem(placement: .primaryAction) {
          Toggle(isOn: $isShowFavoriteOnly) {
            Image(systemName: isShowFavoriteOnly ? "heart.fill" : "heart")
              .foregroundStyle(isShowFavoriteOnly ? .pink : .gray)
              .imageScale(.large)
          }
          .tint(.clear)
        }
      }
      .navigationDestination(for: Area.self) { area in
        WeatherDetail(area: area)
      }
    }
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
