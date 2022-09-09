//
//  HomeHeader.swift
//  
//
//  Created by Yoan Smit on 07/09/2022.
//

import Foundation
import Plot
import Publish

struct HomeHeader: Component {
    var context: PublishingContext<CodingWithWolves>
    
    var body: Component {
        Header {
            Div{
                H1(html: "Coding with Wolves")
                    .class("post-list__header__title")
                HR(style: .header)
                H2("Le monde du développement n'est pas une histoire de loup solitaire, rejoins la meute !")
                    .class("post-list__header__subtitle")
            }.class("post-list__container")
        }
        .class("post-list__header")
    }
}




