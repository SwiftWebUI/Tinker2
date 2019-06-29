//
//  ButtonRow.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct ButtonRow : View {
  
  struct StatefulButton: View {
    @State private var counter = 0
    let title : String
    
    var body: some View {
      Button({
        self.counter += 1; print("clicked:", self.title, self.counter)
      }) {
        Text("\(title)[\(self.counter)]")
      }
    }
  }
  
  
  var body: some View {
    HStack(spacing: 30) {
      ForEach(1...3) { item in
        StatefulButton(title: "\(item)")
      }
    }
  }
  
}

