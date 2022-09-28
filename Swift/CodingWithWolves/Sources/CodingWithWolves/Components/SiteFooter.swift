//
//  SiteFooter.swift
//  
//
//  Created by Yoan Smit on 11/09/2022.
//

import Foundation
import Plot
import Publish

struct SiteFooter: Component {
    
    private let socialLinks = [
        SocialLink(name: "RSS", url: "/feed.xml", class: "fa fa-rss fa-inverse"),
        SocialLink(name: "GitHub", url: "https://github.com/Naxyoh", class: "fab fa-github fa-inverse"),
        SocialLink(name: "LinkedIn", url: "https://linkedin.com/in/yoan-smit", class: "fab fa-linkedin fa-inverse"),
    ]
    
    let context: PublishingContext<CodingWithWolves>
    
    var body: Component {
        Footer {
            Div {
                List(socialLinks) { socialLink in
                    SocialLinkButton(link: socialLink)
                }
                Span {
                    Text("Yoan Smit © 2022 &nbsp;•&nbsp; ")
                    Link("CodingWithWolves.com", url: context.index.path.absoluteString)
                        .class("footer-link")
                }
                    .class("footer__copyright")
                    .class("footer-text")
                Paragraph {
                    Text("Ce blog est couvert selon les termes de la ")
                        
                    Link(
                        "Licence Creative Commons Attribution 4.0 International",
                        url: "http://creativecommons.org/licenses/by/4.0/"
                    )
                        .attribute(named: "target", value: "_blank")
                        .class("footer-link")
                }
                .class("footer__license")
                .class("footer-text")
            }
            .class("footer__container")
        }
    }
    
}

private struct SocialLink {
    let name: String
    let url: URLRepresentable
    let `class`: String
}

private struct SocialLinkButton: Component {
    
    let link: SocialLink
    
    var body: Component {
        Link(url: link.url) {
            Span() {
                I()
                    .class(link.class)
            }
                .attribute(named: "aria-hidden", value: "true")
                .class("rounded")
                .class("background-gray")
                .class("link-container")
        }
        .attribute(named: "title", value: link.name)
        .attribute(named: "target", value: "_blank")
    }
    
}
