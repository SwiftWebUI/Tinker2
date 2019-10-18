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
      
      TabView {
        
        OrderPage()
          .tag(10)
          .tabItem(Text("🥑 Order"))

        /* Landmarks thing
        TestSections()
          .tag(6)
          .tabItem(Text("Sections"))
         */

        TestNavigationView() // TestListView() // 
          .tag(2)
          .tabItem(Text("Navigation"))
        
        MainTreeOld()
          .tag(0)
          .tabItem(Text("Test Stuff"))
        
        BindingTestView()
          .tag(88)
          .tabItem(Text("Bindings"))
        
        SFSymbolsTest()
          .tag(89)
          .tabItem(Text("SFSymbols"))
        
        Image("turtlerock.jpg")
          .tag(99)
          .tabItem(Text("Nice Image"))
        
        /*
        MainTreeWithHTMLTabs()
          .tag(1)
          .tabItem(Text("Nested"))

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
