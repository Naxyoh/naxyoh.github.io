//
//  PostFooter.swift
//  
//
//  Created by Yoan Smit on 30/09/2022.
//

import Publish
import Plot

struct PostFooter: Component {
    
    let previousPost: Item<CodingWithWolves>?
    let nextPost: Item<CodingWithWolves>?
    
    
    var body: Component {
        Div {
            if let previousPost = previousPost {
                Link("← ARTICLE PRÉCÉDENT", url: previousPost.path.absoluteString)
                    .class("post-details__footer__previous")
            }
            if let nextPost = nextPost {
                Link("ARTICLE SUIVANT →", url: nextPost.path.absoluteString)
                    .class("post-details__footer__next")
            }
        }
        .class("post-details__footer")
    }
}
