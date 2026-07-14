//
//  SwiftUIView.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/13.
//

import SwiftUI

struct FavoriteButton: View {
  @Binding var isSet : Bool
  
  
    var body: some View {
      
      Button{
        isSet.toggle()
      }label:{
        Label("Toggle Favorite", systemImage: isSet ? "heart.fill":"heart")
          .labelStyle(.iconOnly)
          .foregroundStyle(isSet ? .pink:.gray)
      }
    }
}

#Preview {
  FavoriteButton(isSet: .constant(true))
}
