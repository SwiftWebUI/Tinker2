//
//  MainViews.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct MainTreeOld : View {
  let a = 5
  
  @State private var makeItBold = false
  
  #if false // those require that you add the Landmark model from the Apple demo
  @State private var pickedID : Int = landmarkData.first!.id
  
  var pickedLabel: String {
    let pickedLandmark = landmarkData.first(where: { $0.id == pickedID })
    return pickedLandmark?.name ?? "Pick[\(pickedID)]"
  }
  #endif
  
  @State var quantity: Int = 3
  
  var body: some View {
    // https://zeezide.de/img/bucht-256x256.jpeg
    ScrollView {
    VStack {
      //TestEnvironmentView()
      //EnvObjectViewTest()
      
      Stepper(value: self.$quantity, in: 3...8) {
        Text("Quantity \(quantity)")
      }
      
      SomeEditableList()
        .isEnabled(makeItBold)

      HStack {
        Toggle(isOn: $makeItBold) {
          if makeItBold { Text("Checked!").bold() }
          else          { Text("Unchecked!")      }
        }
        
        /* // those require that you add the Landmark model from the Apple demo
        Picker(selection: self.$pickedID, label: Text("Picker")) {
          ForEach(landmarkData) { item in
            Text(item.name)
            .tag(item.id)
          }
        }
        Text("\(pickedLabel)")
        Picker(selection: self.$pickedID, label: Text("Picker2")) {
          ForEach(landmarkData) { item in
            Text(item.name)
              .tag(item.id)
          }
        }
         */
      }
      /* // those require that you add the Landmark model from the Apple demo
      Picker(selection: self.$pickedID, label: Text("Picker")) {
        ForEach(landmarkData) { item in
          Text(item.name)
            .tag(item.id)
        }
      }.pickerStyle(.radioGroup)
       */
      
      Group {
        // LandmarksList()
        ParkInfoSection(landmark: "Turtle Rock",
                        location: "Joshua Tree National Park",
                        state: "California").padding()
      }
      
      AvocadoToastTest()

      Group {
        Button({ print("Hello World!") }) {
          Text("Click me!")
        }.padding()
          .isEnabled(makeItBold)

        ButtonRow()
          .isEnabled(makeItBold)
      }
      
      Group {
        VStack { RepeatSomeItems() }
        HStack { // works, for each items layout vertically
          // test:HTML("<div style='display: flex;'>")
          RepeatSomeItems()
          // test:HTML("</div>")
        }
      }
    }
    }
  }
}

struct MainTreeX: View {
  
  var body: some View {
    VStack {
      Text("Hello")
      Text("World")
      }
      .relativeWidth(0.8)
      .relativeHeight(1)
  }
}
