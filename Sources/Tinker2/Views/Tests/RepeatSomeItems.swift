//
//  RepeatSomeItems.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct RepeatSomeItems: View {
  
  var body: some View {
    ForEach(1...3) { item in
      Text("Counting: \(item)")
    }
  }
}
