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
            if let nextPost = nextPost {
                Link("ARTICLE PRÉCÉDENT →", url: nextPost.path.absoluteString)
                    .class("post-details__footer__next")
            }
            if let previousPost = previousPost {
                Link("← ARTICLE SUIVANT", url: previousPost.path.absoluteString)
                    .class("post-details__footer__previous")
            }
            
        }
        .class("post-details__footer")
    }
}
