//
//  ParkInfoSection.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct ParkInfoSection: View {
  
  let landmark : String
  let location : String
  let state    : String
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(landmark)
        .font(.title)
      HStack(alignment: .top) {
        Text(location)
          .font(.subheadline)
        
        Spacer()
        
        Text(state) // FIXME: This becomes a child of Spacer?!
          .font(.subheadline)
          //.padding()
      }
    }
  }
}
