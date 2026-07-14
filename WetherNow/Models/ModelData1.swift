//
//  ModelData.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//
//
import Foundation

@Observable
class ModelData1 {
    
    var weatherData: [WeatherData] = load("wetherData.json")
    
    var Forecasts: [Forecast] {
        weatherData.first?.forecasts ?? []
    }
  
}




func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        // 💡 呼び出し側の指定（今回は[WeatherData]）を自動で読み取ってパースします
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
