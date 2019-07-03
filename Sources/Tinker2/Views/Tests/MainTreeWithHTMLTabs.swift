//
//  MainTreeWithHTMLTabs.swift
//  Tinker2
//
//  Created by Helge Heß on 20.06.19.
//  Copyright © 2019 Helge Heß. All rights reserved.
//

import SwiftWebUI

struct MainTreeWithHTMLTabs : View {
  
  struct TabContent<Content: View>: View {
    let isActive : Bool
    let tag      : String
    let content  : Content // custom ViewBuilder init for better usability
    var body: some View {
      HTMLContainer(attributes: [ "data-tab": tag],
                    classes: [
                      "ui", "bottom", "attached", "tab", "segment",
                      isActive ? "active" : ""
                    ])
      { content }
    }
  }
  
  var body: some View {
    SUISegment(width: 1.0) {
      HTMLContainer(classes: [ "ui", "top", "attached", "tabular", "menu" ]) {
        HTMLContainer("a",
                      attributes: [ "data-tab": "edit"],
                      classes: [ "active", "item" ])
        {
          Text("Edit")
        }
        HTMLContainer("a",
                      attributes: [ "data-tab": "other"],
                      classes: [ "item" ])
        {
          Text("Other")
        }
      }
      
      TabContent(isActive: true,  tag: "edit",  content: MainTreeOld())
      TabContent(isActive: false, tag: "other", content: Text("Other Content"))
      
      HTML( // FIXME: replace with own onClick?!
        """
        <script language='JavaScript' type='text/javascript'>
          $('.menu .item').tab();
        </script>
        """
      )
    }
      .padding()
    // this doesn't help, just puts a frame around the smaller content
    // .frame(width: .percent(100), height: .percent(100))
      .relativeWidth(0.95)
      .relativeHeight(0.95)
  }
}

