//
//  LandmarkListInfo.swift
//  Tinker2
//
//  Created by Helge Heß on 25.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

#if false // those require that you add the Landmark model from the Apple demo

import SwiftWebUI

struct LandmarkListInfo: View {
  
  let landmark : Landmark
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text("\(landmark.name) (\(landmark.id))")
          .font(.headline)
      }
      HStack {
        Text(landmark.park)
        Spacer()
        Text(landmark.state)
      }.font(.subheadline)
    }
    .padding()
  }
  
}

#endif
