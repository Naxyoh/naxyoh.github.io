//
//  BodyContent.swift
//  
//
//  Created by Yoan Smit on 22/09/2022.
//

import Publish
import Plot

struct BodyContent: ComponentContainer {
    @ComponentBuilder var content: ContentProvider

    var body: Component {
        Div(content: content)
            .class("page-content")
    }
}
