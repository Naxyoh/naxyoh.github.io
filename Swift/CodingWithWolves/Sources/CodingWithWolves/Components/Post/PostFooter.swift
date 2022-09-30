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
        HTML {
            if let previousPost = previousPost {
                Link("Previous", previousPost.path.absoluteString)
            }
            if let nextPost = nextPost {
                Link("Next", nextPost.path.absoluteString)
            }
        }
    }
}
