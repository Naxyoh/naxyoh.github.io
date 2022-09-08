//
//  File.swift
//  
//
//  Created by Yoan Smit on 08/09/2022.
//

import Publish
import Plot


extension Node where Context: HTML.BodyContext {
    static func hr() -> Node {
        .selfClosedElement(named: "hr")
    }
}

struct HR: Component {
    
    enum Style {
        case header
        case postList
        case post
    }
    
    private let style: Style
    
    init(style: Style) {
        self.style = style
    }
    
    var body: Component {
        Node.hr()
            .class(classFrom(style))
    }
    
    private func classFrom(_ style: Style) -> String {
        switch style {
        case .header:
            return "small black"
        case .postList:
            return "large"
        case .post:
            return "small gray"
        }
    }
    
}
