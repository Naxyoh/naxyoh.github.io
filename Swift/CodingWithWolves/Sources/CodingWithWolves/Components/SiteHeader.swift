//
//  SiteHeader.swift
//  
//
//  Created by Yoan Smit on 02/05/2022.
//

import Foundation
import Plot
import Publish

struct SiteHeader: Component {
    var context: PublishingContext<CodingWithWolves>
    
    var body: Component {
        Navigation {
            Div {
                SiteHeaderLink("C2W", url: "/posts")
                    .class("site-header__anchor")
                SiteHeaderLink("Yoan Smit", url: "/about")
                    .class("site-header__navigation-item")
                Div {
                    Image(url: "/images/avatar.png", description: "Avatar de Coding with Wolves")
                        .class("site-header__avatar")
                }.class("site-header__avatar-container")
            }
        }.class("site-header")
    }
}

private struct SiteHeaderLink: Component {
    
    let label: String
    let url: URLRepresentable
    
    init(_ label: String, url: URLRepresentable) {
        self.label = label
        self.url = url
    }
    
    var body: Component {
        Span {
            Link(label, url: url)
                .class("site-header__navigation-item__link")
        }
    }
    
}
