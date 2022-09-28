//
//  HomeHeader.swift
//  
//
//  Created by Yoan Smit on 07/09/2022.
//

import Foundation
import Plot
import Publish

struct PageHeader: Component {
    
    let title: String
    let subtitle: String
    
    var body: Component {
        Header {
            Div{
                H1(title)
                    .class("post-list__header__title")
                HR(style: .header)
                H2(subtitle)
                    .class("post-list__header__subtitle")
            }.class("post-list__container")
        }
        .class("post-list__header")
    }
}
