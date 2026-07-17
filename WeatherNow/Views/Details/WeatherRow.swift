//
//  WeatherRow.swift
//  WeatherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import SDWebImageSwiftUI
import SwiftUI

struct WeatherRow: View {
  var forecast: Forecast

  var body: some View {
    VStack {
      HStack {
        Text(forecast.date)

        Spacer()

        HStack {
          WebImage(url: forecast.image.url) { image in
            image.resizable()
              .aspectRatio(contentMode: .fit)
          } placeholder: {
            Color.gray
              .overlay(Image(systemName: "photo").scaleEffect(2.0))
          }.frame(width: 60, height: 60)
          HStack {
            Text(forecast.image.title)
              .frame(width: 80, height: 40, alignment: .center)
          }
          .frame(width: 100, height: 40, alignment: .leading)
        }
      }
      HStack {
        Spacer()
        HStack {
          Text("最高:")
            .foregroundColor(.secondary)
            .font(.callout)

          Text("\(forecast.temperature.max.celsius ?? "--")℃")
            .foregroundColor(.red)
            .fontWeight(.semibold)
            .frame(width: 60, height: 20, alignment: .center)
        }
        .padding(.top, 4)

        HStack {
          Text("最低:")
            .foregroundColor(.secondary)
            .font(.callout)

          Text("\(forecast.temperature.min.celsius ?? "--")℃")
            .foregroundColor(.blue)
            .fontWeight(.semibold)
            .frame(width: 60, height: 20, alignment: .center)
        }
      }
    }
  }
}

#Preview {
  let forecast = Forecast(
    date: "2026-07-09",
    image: ImageInfo(
      title: "曇り時々雨",
      url: URL(string: "https://www.jma.go.jp/bosai/forecast/img/202.svg")!
    ),
    temperature: Temperature(
      max: Max(
        celsius: "30"

      ),
      min: Min(
        celsius: "24"
      )
    )
  )

  WeatherRow(forecast: forecast)
}
