//
//  PostHeader.swift
//  
//
//  Created by Yoan Smit on 22/09/2022.
//

import Publish
import Plot
import Foundation

struct PostHeader: Component {
    
    let post: Item<CodingWithWolves>
    
    
    var body: Component {
        Div {
            H1(post.title)
                .class("post-details__title")
            H2(post.metadata.subtitle)
                .class("post-details__subtitle")
            Span("Posté le \(DateFormatter.wolf.string(from: post.date))")
                .class("post-details__metadata")
            Span(" · ")
                .class("post-details__metadata")
            Span(readingTime())
                .class("post-details__metadata")
        }
    }
    
    private func readingTime() -> String {
        let averagePace = 200
        let readingTime = post.metadata.wordCount / averagePace
        
        if readingTime > 1 {
            return "\(Int(readingTime)) minutes"
        } else {
            return "\(Int(readingTime)) minute"
        }
    }
}
