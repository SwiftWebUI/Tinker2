//
//  SFSymbols.swift
//  Tinker2
//
//  Created by Helge Heß on 22.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import Foundation
import SwiftWebUI

struct SFSymbolsTest: View {
  
  struct TestRow: View {
    let label : String
    var body: some View {
      HStack {
        Text(label)
        Spacer()
        SUIFlag(code: "de")
        Group {
          Image(systemName: "arrow.up.circle")
          Image(systemName: "arrow.up.circle.fill")
        }
        Group {
          Image(systemName: "arrowtriangle.up")
          Image(systemName: "arrowtriangle.up.fill")
        }
        Group {
          Image(systemName: "envelope")
          Image(systemName: "envelope.fill")
        }
        Group {
          Image(systemName: "cart.badge.plus")
          Image(systemName: "cart.badge.plus.fill")
        }
        Image(systemName: "power")
        Image(systemName: "sun.max")
      }
    }
  }
  
  var body: some View {
    VStack {
      Group {
        TestRow(label: "regular")
        TestRow(label: "small").imageScale(.small)
        TestRow(label: "large").imageScale(.large)
      }

      Divider()
      
      VStack(alignment: .leading) {
        SUILabel(Image(systemName: "mail")) { Text("42") }
        HStack {
          ForEach(suiAvatars1.identified(by: \.self)) { avatar in
            SUILabel(suiImage(avatar.lowercased())) { Text(avatar) }
          }
        }
        HStack {
          ForEach(suiAvatars2.identified(by: \.0)) { avatar in
            SUILabel(suiImage(avatar.0.lowercased()),
                     Color(suiTypeToColor[avatar.1]!),
                     detail: Text(avatar.1))
            {
              Text(avatar.0)
            }
          }
        }
      }

      Divider()
      
      SUICards {
        SUICard(Image.unsplash(size: UXSize(width: 200, height: 200),
                               "Zebra", "Animal"),
                Text("Some Zebra"),
                meta: Text("Roaming the world since 1976"))
        {
          Text("A striped animal.")
        }
        SUICard(Image.unsplash(size: UXSize(width: 200, height: 200),
                               "Cow", "Animal"),
                Text("Some Cow"),
                meta: Text("Milk it"))
        {
          Text("Holy cow!.")
        }
      }
    }
  }
}

let suiAvatars1 = [ "Joe", "Elliot", "Stevie" ]
let suiAvatars2 = [
  ( "Veronika", "Friend"    ),
  ( "Veronika", "Student"   ),
  ( "Helen",    "Co-worker" )
]
let suiTypeToColor = [
  "Friend": "blue",
  "Student": "teal",
  "Co-worker": "yellow"
]

func suiImage(category: String = "avatar", _ name: String,
              size: String = "small")
     -> Image
{
  let baseURL = "https://semantic-ui.com/images"
  return Image(URL(string: "\(baseURL)/\(category)/\(size)/\(name).jpg")!)
}
