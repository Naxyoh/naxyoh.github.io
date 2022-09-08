//
//  PostList.swift
//  
//
//  Created by Yoan Smit on 07/09/2022.
//

import Foundation
import Plot
import Publish

struct PostList: Component {
    let posts: [Item<CodingWithWolves>]
    
    var body: Component {
        List(posts) { post in
            PostPreview(post: post)
        }
        .class("post-list__container")
    }
    
}
