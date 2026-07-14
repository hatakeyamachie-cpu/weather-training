//
//  wetherDetail.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import SwiftUI

struct WeatherDetail: View {
  @Environment(ModelData.self) var modelData
  let area: Area
  @State private var detailData: WeatherData?
  var areaIndex: Int {
          modelData.areas.firstIndex(where: { $0.id == area.id })!
      }
  
  var body: some View {
    @Bindable var modelData = modelData
    NavigationStack{
      Group{
        if let data = detailData {
          List(data.forecasts) {forecast in
            WeatherRow(forecast:forecast)
            
          }
          .listStyle(.plain)
          .padding(.top, 30)
          .navigationTitle("")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar {
            ToolbarItem(placement: .principal) {
              HStack(spacing: 8) {
                Image(systemName: "cloud.sun.rain")
                  .symbolRenderingMode(.palette)
                  .foregroundStyle(.blue,.red,.cyan)
                
                Text(data.location.city)
                  .font(.title)
                
                FavoriteButton(isSet: $modelData.areas[areaIndex].isFavorite)
                
              }
              .padding(.top,40)
              .padding(.bottom)
            }
          }
        }else{
          Text("読み込み中・・・")
        }
    }
  }
  .task {
     await loadDetailData()
    }
}
func loadDetailData() async {
        do {
            let data = try await modelData.loadWeatherData(for: area.cityCode)
            self.detailData = data
        } catch {
            print("エラー：\(error)")
        }
    }
}

#Preview {
  let modelData = ModelData()
  WeatherDetail(area: modelData.areas[0])
    .environment(modelData)
}
