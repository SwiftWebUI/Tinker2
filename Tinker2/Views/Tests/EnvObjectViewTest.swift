//
//  EnvObjectViewTest.swift
//  Tinker2
//
//  Created by Helge Heß on 21.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct EnvObjectViewBodyTest: View {
  
  @EnvironmentObject var store : BindingTestStore
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Hello \(store) \(store.i)")
    }
  }
}
struct EnvObjectViewTest: View {
  
  var body: some View {
    EnvObjectViewBodyTest()
      .environmentObject(BindingTestStore.global)
  }
}
