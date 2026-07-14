//
//  ContentView.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import SwiftUI

struct ContentView: View {
  @Environment(ModelData.self) var modelData
  @State private var selectedWeatherData:Area?
  @State private var searchText = ""
  @State private var showFavoriteOnly = false
  
  var filteredAreas:[Area]{
    modelData.areas.filter{area in
      (!showFavoriteOnly || area.isFavorite)
    }
  }
  
  var body: some View {
    
    NavigationSplitView{
      List(filteredAreas,selection: $selectedWeatherData){area in
        NavigationLink(value: area){
          AreaRow(area: area)
        }
       
      }
      .animation(.default,value:filteredAreas)
      .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 8) {
                        Image(systemName: "cloud.sun.rain")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.blue,.red,.cyan)
                        Text("週間天気を見る")
                        .font(.title)
                    }.padding(.top,30)
                }
                ToolbarItem(placement: .primaryAction) {
                  Toggle(isOn: $showFavoriteOnly) {
                      Label("お気に入り", systemImage: "heart.fill")
                    }
                  .tint(.pink)
                }
              }
          
    }detail: {
      if let selected = selectedWeatherData {
          WeatherDetail(area: selected)
      } else {
          Text("地域を選んでください")
      }
    }
  }
}

#Preview {
  ContentView()
    .environment(ModelData())
}
