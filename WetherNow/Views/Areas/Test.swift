//
//  SwiftUIView.swift
//  WetherNow
//
//  Created by hatakeyama.chie on 2026/07/06.
//

import SwiftUI

struct Test: View {
  @State var num = 0
  
  
  var body: some View {
    VStack{
      
      HStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundColor(.blue)
        Text("Hello, World!")
          .font(.title)
          .fontWeight(.thin)
          .background(Color.yellow)
        
        
      }
      .padding(.top,80)
      
      VStack {
        RoundedRectangle(cornerRadius: 5)
          .foregroundStyle(Color.sakura.gradient)
          .frame(width: 50,height: 50)
          .shadow(color: .black.opacity(0.5), radius:5, x:0, y:3)
      }
      ZStack{
        Capsule()
          .frame(width: 50, height: 100)
          .rotationEffect(.degrees(45),anchor:.bottom)
        
          .foregroundStyle(
            LinearGradient(
              gradient:Gradient(colors: [.pink,.sakura]),
              startPoint: .topLeading,
              endPoint: .bottomTrailing)
          )
        Capsule()
          .frame(width: 50, height: 100)
          .foregroundStyle(
            LinearGradient(
              gradient:Gradient(colors: [.pink,.sakura]),
              startPoint: .topLeading,
              endPoint: .bottomTrailing)
          )
        Capsule()
          .frame(width: 50, height: 100)
          .rotationEffect(.degrees(-45),anchor:.bottom)
        
          .foregroundStyle(
            LinearGradient(
              gradient:Gradient(colors: [.pink,.sakura]),
              startPoint: .topLeading,
              endPoint: .bottomTrailing)
          )
      }
      .padding(.bottom,80)
      
      ZStack{

        Image("サントリーニ")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 300,height: 200)
          .border(Color.blue)
          .shadow(color:.blue .opacity(0.2) , radius: 20)
          .clipped()
          
        
        Text("サントリーニ")
          .foregroundColor(.white)
          .font(.title)
          .fontWeight(.bold)
          
        
      }.rotation3DEffect(.degrees(45),axis: (x:1, y: 1, z: 0))
      
      VStack{
        Button("Button"){
          num = Int.random(in: 0...11)
        }
        .font(.title)
        .buttonStyle(.bordered)
        .padding()
        
        Text("\(num)")
          .font(.largeTitle)
      }
    }
    .frame(width: 300)
    
    
  }
}

#Preview {
  Test()
}


struct Test2: View {
  let shikoku = ["徳島","愛媛","高知","香川"]
  let kanto = ["東京","神奈川","埼玉","千葉","栃木","群馬"]
  @State var volume: Double = 0.0
  
  
  var body: some View {
    List{
      Section(header: Text("四国").font(.largeTitle).padding(.top),footer: Text("四国はよっつの県からできている")) {
        ForEach(shikoku, id:\.self){item in
          Text(item)
        }
        
      }
      Section(header: Text("関東").font(.largeTitle).padding(.top),footer: Text("関東は巨大な平地である")) {
        ForEach(kanto, id:\.self){item in
          Text(item)
        }
        
      }

    }
    .listStyle(.plain)
    
    VStack{
      GroupBox{
        Slider(value: $volume)
        Text("\(volume)").font(.largeTitle)
      }.frame(width: 300)
      
      Image(systemName: "speaker.wave.3",variableValue: volume)
        .resizable()
        .frame(width: 100, height: 100)
      
      
    }
    .padding()
  }
}

#Preview {
  Test2()
}


func saveText(_ textData:String, _ fileName:String){
  
}
func loadText(_ fileName:String) -> String?{
  return nil
}

struct Test3: View {
  @State var vehicle = 0
  let names = ["bicycle","car","tram"]
  @State var theDate = Date()
  @State var name : String = ""
  @State var theText : String=""
  @FocusState var isInputActive:Bool
  
  
  var body: some View {
    VStack{
      List{
        Picker(selection: $vehicle, label:Text("乗り物")) {
          Text("自転車").tag(0)
          Text("車").tag(1)
          Text("電車").tag(2)
        }
        .buttonStyle(.bordered)
        .pickerStyle(.segmented)
        
        Image(systemName: names[vehicle])
          .resizable()
          .frame(width: 50,height: 50)
        DatePicker(selection: $theDate, label: { Text("日時") })
          .environment(\.locale,Locale(identifier: "ja_jp"))
      }
      NavigationView{
        TextEditor(text:$theText )
          .lineSpacing(10)
          .border(Color.gray)
          .padding([.leading,.bottom,.trailing])
          .navigationTitle("memo")
          .focused($isInputActive)
        
          .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
              Button("読み込む"){
                
              }
            }
            
          }
      }
      
      
    }
  }
}
  
#Preview {
  Test3()
}
