//
//  MainPage.swift
//  AvocadoToast
//
//  Created by Helge Heß on 27.06.19.
//  Copyright © 2019 ZeeZide GmbH. All rights reserved.
//

import SwiftWebUI

struct MainPage: View {
  
  @State var counter = 0
  
  func countUp() { counter += 1 }
  
  var body: some View {
    HStack {
      Text("🥑🍞")
        .background(.green, cornerRadius: 12)
        .padding(.all)
      
      Text(" => ")
      
      Text("🥑🍞")
        .padding(.all)
        .background(.green, cornerRadius: 12)
    }
    /*
    HStack {
      Text("🥑🍞")
        .padding(.all)
        .background(.green, cornerRadius: 12)
      Spacer()
      
      Text("Count: \(counter)")
      Button(self.countUp) {
        Image(systemName: "cart.badge.plus button")
      }
    }.padding(.fontSize(2))
     */
  }
}
