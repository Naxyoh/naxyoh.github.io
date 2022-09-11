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
            Paragraph("Posté le \(DateFormatter.wolf.string(from: post.date))")
                .class("post-preview__metadata")
            PostPreviewDescription(
                description: post.metadata.preview,
                url: post.path.absoluteString)
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

private struct PostPreviewDescription: Component {
    
    let description: String
    let url: URLRepresentable
    
    var body: Component {
        Div {
            Text(description).body
            Text(" ")
            Link("[Lire&nbsp;la&nbsp;suite]", url: url)
                .class("post-preview__post-link")
        }
        .class("post-preview__preview")
    }
    
}
