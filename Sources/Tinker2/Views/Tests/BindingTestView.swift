//
//  BindingTestView.swift
//  Tinker2
//
//  Created by Helge Heß on 21.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

#if false // duplicate ObservableObject
  #if canImport(Combine)
    import Combine
  #elseif canImport(OpenCombine)
    import OpenCombine
  #endif
#else
  #if canImport(Combine)
    import class Combine.PassthroughSubject
  #elseif canImport(OpenCombine)
    import class OpenCombine.PassthroughSubject
  #endif
#endif
import SwiftWebUI

class BindingTestStore: ObservableObject { // FIXME
  static let global = BindingTestStore()
  var didChange = PassthroughSubject<Void, Never>()
  var i = 5 { didSet { didChange.send(()) } }
  
  func advance() {
    i += 1
  }
}

struct BindingTestView: View {
  
  @ObservedObject var store = BindingTestStore.global

  var body: some View {
    VStack(alignment: .leading) {
      Text("Hello \(store.i)")
      //BindingObjectBindingButton(store: store)
      Button("Advance") { self.store.advance() }
    }
  }
}
