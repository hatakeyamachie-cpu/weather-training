//
//  WeatherData.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import Foundation

struct WeatherData: Decodable , Identifiable, Hashable{
    let id = UUID()
    let forecasts: [Forecast]
    let location: Location
    
  private enum CodingKeys: String, CodingKey {
          case forecasts, location
      }
}

struct Area: Identifiable, Hashable {
    let id = UUID()
    let areaName: String
    let cityCode: String
    var isFavorite:Bool
}

struct Location: Decodable,Hashable {
    let city: String
}


struct Forecast: Decodable, Identifiable, Hashable {
    // 日付（date）をそのままユニークなIDとして使う
    var id: String { date }
    let date: String
    let image: ImageInfo
    let temperature:Temperature
}

struct ImageInfo: Decodable,Hashable {
    let title: String
    let url: URL
}

struct Temperature: Decodable,Hashable{
  let max: Max
  let min: Min
}

struct Max:Decodable,Hashable{
  let celsius:String?
}

struct Min:Decodable,Hashable{
  let celsius:String?
}

