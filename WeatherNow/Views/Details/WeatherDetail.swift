//
//  WeatherDetail.swift
//  WeatherNow
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

    Group {
      if let data = detailData {
        let _ = print(" [WeatherDetail Visual] データを元にリストを描画: \(data.location.city)")
        List(data.forecasts) { forecast in
          WeatherRow(forecast: forecast)
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
                .foregroundStyle(.blue, .red, .cyan)

              Text(data.location.city)
                .font(.title)

              FavoriteButton(isSet: $modelData.areas[areaIndex].isFavorite)
            }
            .padding(.top, 40)
            .padding(.bottom)
          }
        }
      } else {
        Text("読み込み中・・・")
      }
    }

    .task(id: area.id) {
      print(" [Task Start] 通信を開始: \(area.areaName) (Code: \(area.cityCode))")
      detailData = nil
      await loadDetailData()
    }
  }

  func loadDetailData() async {
    do {
      let data = try await modelData.loadWeatherData(for: area.cityCode)
      if Task.isCancelled {
        return
      }
      print(" [Task Success] データの取得に成功しました: \(area.areaName)")
      detailData = data
    } catch {
      if let urlError = error as? URLError, urlError.code == .cancelled {
        print(" [Task Cancelled] 通信が正常にキャンセルされました: \(area.areaName)")
        return
      }
      print(" [Task Error] エラーが発生しました：\(error) (\(area.areaName))")
    }
  }
}

#Preview {
  let modelData = ModelData()
  WeatherDetail(area: modelData.areas[0])
    .environment(modelData)
}
