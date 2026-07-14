//
//  areaRow.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/03.
//

import SwiftUI

struct AreaRow: View {
  var area: Area
  
  var body: some View {
    
    HStack{
      Text(area.areaName)
      
      Spacer()
      if area.isFavorite{
        Image(systemName: "heart.fill")
          .foregroundStyle(.pink)
      }
    }
  }
}

#Preview {
  let modelData = ModelData()
  AreaRow(area:modelData.areas[0])
}
