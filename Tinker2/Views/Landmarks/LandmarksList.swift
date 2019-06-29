//
//  LandmarksList.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

#if false // those require that you add the Landmark model from the Apple demo
import SwiftWebUI

struct LandmarksList: View {
  
  var body: some View {
    ForEach(landmarkData) { landmark in
      ParkInfoSection(landmark: landmark.name,
                      location: landmark.park,
                      state: landmark.state)
        .padding()
    }
  }
  
}
#endif
