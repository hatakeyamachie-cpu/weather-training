//
//  WeatherFecher.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/09.
//

import Foundation


class WeatherAPIClient {
    func fetchWeather(cityCode: String) async throws -> WeatherData {
      let urlString = "https://weather.tsukumijima.net/api/forecast/city/\(cityCode)"
//      文字列をURLに変換
      guard let url = URL(string: urlString) else {
                  throw URLError(.badURL)
      }
//        API にアクセスして JSON データを取得（非同期処理）
      let (data, _) = try await URLSession.shared.data(from: url)
        
      let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
        
//        JSON データを WeatherData 構造体に変換
      return try decoder.decode(WeatherData.self, from: data)
        
    }
}
