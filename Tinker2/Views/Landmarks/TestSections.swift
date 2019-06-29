//
//  TestSections.swift
//  Tinker2
//
//  Created by Helge Heß on 26.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

#if false // those require that you add the Landmark model from the Apple demo
import SwiftWebUI

struct TestSections: View {
  
  var body: some View {
    Section(header: Text("Landmarks"), footer: Text("Visit them all!")) {
      ForEach(landmarkData.dropLast(8).sorted(by: {$0.id < $1.id})) { item in
        LandmarkListInfo(landmark: item)
      }
    }
  }
  
}
#endif
