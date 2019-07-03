//
//  AvocadoToastTest.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct AvocadoToastTest: View {
  
  var body: some View {
    VStack {
      Text("🥑🍞")
        .padding(.all)
        .background(.green, cornerRadius: 12)
      
      Text("🥑🍞")
        .background(.green, cornerRadius: 12)
        .padding(.all)
    }
  }
}
