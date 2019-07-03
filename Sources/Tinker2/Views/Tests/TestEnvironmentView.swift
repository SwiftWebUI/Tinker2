//
//  TestEnvironmentView.swift
//  Tinker2
//
//  Created by Helge Heß on 21.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct TestEnvironmentView: View {
  
  @Environment(\.isEnabled) var isEnabled : Bool
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Hello \(isEnabled ? "true" : "false")")
      Group {
        Text("Nested: \(isEnabled ? "true" : "false")")
      }
      .environment(\.isEnabled, false)
    }
  }
}
