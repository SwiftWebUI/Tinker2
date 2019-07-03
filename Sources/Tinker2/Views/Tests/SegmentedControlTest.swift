//
//  SegmentedControlTest.swift
//  Tinker2
//
//  Created by Helge Heß on 23.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct SegmentedControlTest: View {
  
  @State private var currentIndex = 0
  let items = [
    "Avocado", "Egg", "Beer"
  ]
  
  var body: some View {
    SegmentedControl(selection: $currentIndex) {
      ForEach(0..<items.count) { index in
        Text(self.items[index])
          .tag(index)
      }
    }.tapAction {
      print("currentIndex: \(self.currentIndex)")
    }
  }
}
