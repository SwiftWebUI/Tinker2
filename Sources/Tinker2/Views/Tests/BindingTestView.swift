//
//  BindingTestView.swift
//  Tinker2
//
//  Created by Helge Heß on 21.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import Combine

class BindingTestStore: BindableObject {
  static let global = BindingTestStore()
  var didChange = PassthroughSubject<Void, Never>()
  var i = 5 { didSet { didChange.send(()) } }
  
  func advance() {
    i += 1
  }
}

import SwiftWebUI

#if false
  // Passing ObjectBinding's down via Binding doesn't actually work in SwiftUI,
  // right?

struct BindingObjectBindingButton: View {
  
  @Binding var store : BindingTestStore
  
  var body: some View {
    Button({ self.store.advance() }) { Text("Advance") }
  }
}
#endif

struct BindingTestView: View {
  
  @ObjectBinding var store = BindingTestStore.global

  var body: some View {
    VStack(alignment: .leading) {
      Text("Hello \(store.i)")
      //BindingObjectBindingButton(store: store)
      Button({ self.store.advance() }) { Text("Advance") }
    }
  }
}
