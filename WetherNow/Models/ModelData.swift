//
//  ModelData.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/09.
//

import Foundation
import Combine

@Observable
class ModelData{
    var areas: [Area] = [
      Area(areaName: "大阪", cityCode: "270000",isFavorite: true),
              Area(areaName: "東京", cityCode: "130010",isFavorite: true),
              Area(areaName: "横浜", cityCode: "140010",isFavorite: false),
              Area(areaName: "名古屋", cityCode: "230010",isFavorite: true),
              Area(areaName: "京都", cityCode: "260010",isFavorite: false),
              Area(areaName: "神戸", cityCode: "280010",isFavorite: false),
              Area(areaName: "福岡", cityCode: "400010",isFavorite: true),
              Area(areaName: "札幌", cityCode: "016010",isFavorite: false)
    ]
    
    // 指定した地域の天気データを取得
    func loadWeatherData(for cityCode: String) async throws -> WeatherData {
        return try await WeatherAPIClient().fetchWeather(cityCode: cityCode)
    }
}
