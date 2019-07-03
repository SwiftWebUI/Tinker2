//
//  MainTreeWithTabs.swift
//  Tinker2
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct MainTreeWithTabs: View {
  
  var body: some View {
    SUISegment(width: 1.0 /*, height: 1.0*/) {
      
      TabbedView {
        
        OrderPage()
          .tag(10)
          .tabItemLabel(Text("🥑 Order"))

        /* Landmarks thing
        TestSections()
          .tag(6)
          .tabItemLabel(Text("Sections"))
         */

        TestNavigationView() // TestListView() // 
          .tag(2)
          .tabItemLabel(Text("Navigation"))
        
        MainTreeOld()
          .tag(0)
          .tabItemLabel(Text("Test Stuff"))
        
        BindingTestView()
          .tag(88)
          .tabItemLabel(Text("Bindings"))
        
        SFSymbolsTest()
          .tag(89)
          .tabItemLabel(Text("SFSymbols"))
        
        Image("turtlerock.jpg")
          .tag(99)
          .tabItemLabel(Text("Nice Image"))
        
        /*
        MainTreeWithHTMLTabs()
          .tag(1)
          .tabItemLabel(Text("Nested"))

        ForEach(3...4) { item in
          Text("Blub Body Auto Tag\(item)")
        }
        ForEach(5...6) { item in
          Text("Blub Body\(item)").tag(item)
        }
         */
      }
    }
    .padding()
    .relativeWidth(0.95)
    .relativeHeight(0.95)
  }
}
