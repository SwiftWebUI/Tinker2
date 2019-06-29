//
//  SomeEditableList.swift
//  TestXcodeSPM
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct SomeEditableList: View {
  
  struct Person: Identifiable {
    static var sequence : Int = 1
    static func nextID() -> Int { sequence += 1; return sequence }
    let id        : Int = nextID()
    let firstname : String
    let lastname  : String
    let age       : Int
  }

  @State private var newName : String = "Dagobert"
  
  @State private var items = [
    Person(firstname: "Mickey", lastname: "Mouse", age: 82),
    Person(firstname: "Minney", lastname: "Mouse", age: 72),
    Person(firstname: "Donald", lastname: "Duck",  age: 74)
  ]
 
  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      ForEach(items) { item in
        HStack {
          Text("\(item.firstname) \(item.lastname) (\(item.age))")
            .tapAction {
              print("tapped:", item)
            }
          Spacer()
          Button({
            if let idx = self.items.firstIndex(where: { $0.id == item.id }),
               idx > self.items.startIndex
            {
              self.items.remove(at: idx)
              self.items.insert(item, at: idx - 1)
            }
          }) {
            Image(systemName: "button.arrow.up.circle")
            //Text("⌃")
          }
        }
      }
      HStack {
        TextField($newName)
        Text(newName)
      }
      Button({
        self.items.append(
          Person(firstname: self.newName, lastname: "Duck", age: 42)
        )
      }) {
        Text("Add")
      }
    }
    .padding()
  }
}
