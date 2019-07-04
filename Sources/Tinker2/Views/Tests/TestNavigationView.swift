//
//  PrototypeNavigation.swift
//  Tinker2
//
//  Created by Helge Heß on 22.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//
import SwiftWebUI

//typealias TestNavigationView = TestLandmarksNavigationView
typealias TestNavigationView = TestSimpleNavigationView

#if false // those require that you add the Landmark model from the Apple demo

struct LandmarksDetailsView: View {
  let landmark: Landmark
  
  @State var newData: String = "Blib"

  var body: some View {
    VStack {
      Text(landmark.name)
        .font(.largeTitle)
      Image(landmark.imageName + ".jpg")
      
      Form {
        TextField(self.$newData)
        TextField(self.$newData)
      }
    }
    .padding()
  }
}

struct TestLandmarksNavigationView: View {
  
  @State private var selection: Int? = 1
  
  let emptyView = Image.unsplash(size: UXSize(width: 400, height: 300),
                                 "Zebra", "Animal")
  
  func onTrigger(_ item: Landmark) -> Bool {
    self.selection = item.id
    return true // allow switch
  }
  
  var body: some View {
    NavigationView(emptyView: emptyView) {
      List(landmarkData.sorted(by: {$0.id < $1.id}), selection: $selection) {
        item in
        NavigationButton(destination: LandmarksDetailsView(landmark: item),
                         onTrigger: { self.onTrigger(item) })
        {
          LandmarkListInfo(landmark: item)
        }
        .tag(item.id)
      }
    }
  }
}
#endif

struct TestSimpleNavigationView: View {
  
  struct MyFirstPage: View {
    
    @State private var password: String = ""
    
    var body: some View {
      VStack(alignment: .trailing, spacing: 10) {
        HStack {
          Text("Not secure:")
          SecureField($password)
        }
        HStack {
          Text("We mirror your typing:")
          TextField($password)
        }
        SegmentedControlTest()
      }
    }
  }
  struct MySecondPage: View {
    
    @State private var password: String = ""
    
    var body: some View {
      VStack(alignment: .trailing, spacing: 10) {
        HStack {
          Text("Second Page:")
          SecureField($password)
        }
        HStack {
          Text("Brabbel:")
          TextField($password)
        }
      }
    }
  }

  var body: some View {
    NavigationView() {
      List {
        Text("Blubl")

        HStack(alignment: .center) {
          Image(systemName: "envelope")
          Text("First Page")
        }

        NavigationLink(destination: MyFirstPage()) {
          Image(systemName: "envelope")
          Text("First Page")
        }
        NavigationLink(destination: MySecondPage() /*MainTreeOld()*/) {
          Image(systemName: "power")
          Text("Second Page")
        }
        NavigationLink(destination: MainTreeOld()) {
          Image(systemName: "sun.max")
          Text("MainTree")
        }
      }
    }
    .imageScale(.large)
  }
}

