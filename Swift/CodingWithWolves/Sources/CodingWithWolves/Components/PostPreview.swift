//
//  PostPreview.swift
//  
//
//  Created by Yoan Smit on 02/05/2022.
//

import Foundation
import Plot
import Publish

struct PostPreview: Component {
    let post: Item<CodingWithWolves>
    
    var body: Component {
        Article {
            PostPreviewTitle(
                title: post.title,
                subtitle: post.metadata.subtitle,
                url: post.path.absoluteString)
            Paragraph("Posté le \(post.date)")
            Paragraph(post.metadata.preview)
        }
        .class("post-preview")
    }
    
}

private struct PostPreviewTitle: Component {
    let title: String
    let subtitle: String
    let url: URLRepresentable
    
    var body: Component {
        Link(url: url) {
            H2(title)
                .class("post-title")
            H3(subtitle)
                .class("post-subtitle")
        }.class("post-preview__title")
    }
}
