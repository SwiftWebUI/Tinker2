//
//  TestListView.swift
//  Tinker2
//
//  Created by Helge Heß on 24.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

#if false // those require that you add the Landmark model from the Apple demo
import Foundation
import SwiftWebUI

//typealias TestListView = SingleSelectTestListView
//typealias TestListView = DataBoundTestListView
//typealias TestListView = DataBoundActionTestListView
typealias TestListView = DataBoundActionSelTestListView

struct DataBoundActionSelTestListView: View {

  @State var selection : Int? = 5
  
  func onClick(_ landmark: Landmark) {
    selection = landmark.id // manual selection
    print("clicked:", landmark.name, selection as Any)
  }

  var body: some View {
    VStack(alignment: .center) {
      OneSelectionInfo(selection: selection)
      
      Divider() // doesn't show up, get's zero size
      
      HStack(alignment: .top) {
        List(landmarkData, selection: $selection, action: self.onClick) {
          item in
          // OK in thise case the selection click is overridden. We could fix
          // that, not sure if we want to.
          LandmarkListInfo(landmark: item)
        }
      }
    }
  }
}
struct DataBoundActionTestListView: View {
  
  var body: some View {
    HStack(alignment: .top) {
      List(landmarkData,
           action: { item in print("clicked:", item) })
      { item in LandmarkListInfo(landmark: item) }
    }
  }
}
struct DataBoundTestListView: View {
  
  @State var selection : Int? = 5
  
  var body: some View {
    HStack(alignment: .top) {
      List(landmarkData, selection: $selection) {
        item in LandmarkListInfo(landmark: item )
      }
    }
  }
}

struct OneSelectionInfo: View {
  
  let selection: Int?
  
  var body: some View {
    VStack {
      Text("Welcome to our parks!")
        .font(.headline)
      if selection != nil {
        Text("\(landmarkData.first(where: {$0.id == selection!})!.name)")
          .font(.headline)
      }
      else {
        Text("Select one!")
      }
    }
  }
}

struct SingleSelectTestListView: View {
  
  @State var selection : Int? = 5
  
  var body: some View {
    HStack(alignment: .top) {
      List(selection: $selection) {
        OneSelectionInfo(selection: selection)
        
        ForEach(landmarkData) { item in
          LandmarkListInfo(landmark: item)
            .tag(item.id)
        }
        
        HStack(alignment: .center) {
          Image(systemName: "envelope")
          Text("First Page")
        }
      }
    }
  }
}

struct MultiSelectTestListView: View {
  
  @State var selection : Set<Int> = [ 5 ]
  
  var body: some View {
    HStack(alignment: .top) {
      List(selection: $selection) {
        VStack {
          Text("Welcome to our parks!")
            .font(.headline)
          if !selection.isEmpty {
            if selection.count == 1 {
              Text("\(landmarkData.first(where: {$0.id == selection.first!})!.name)")
            }
            else {
              Text("#\(selection.count) selected.")
            }
          }
          else {
            Text("Select some!")
          }
        }
        
        ForEach(landmarkData) { item in
          LandmarkListInfo(landmark: item)
          .tag(item.id)
        }
        
        HStack(alignment: .center) {
          Image(systemName: "envelope")
          Text("First Page")
        }
      }
    }
  }
}
#endif
