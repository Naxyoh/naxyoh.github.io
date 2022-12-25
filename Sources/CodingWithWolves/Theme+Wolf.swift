//
//  Theme+Wolf.swift
//  
//
//  Created by Yoan Smit on 01/05/2022.
//

import Foundation
import Plot
import Publish

extension Theme where Site == CodingWithWolves {
    static var wolf: Self {
        Theme(htmlFactory: WolfHTMLFactory())
    }
    
    private struct WolfHTMLFactory: HTMLFactory {
        
        func makeIndexHTML(for index: Index, context: PublishingContext<CodingWithWolves>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent {
                        PageHeader(
                            title: "Coding with Wolves",
                            subtitle: "Le monde du développement n'est pas une histoire de loup solitaire, rejoins la meute !")
                        PostList(posts: context.allItems(
                            sortedBy: \.date,
                            order: .descending
                        ))
                    }
                    SiteFooter(context: context)
                }
            )
        }
        
        func makeSectionHTML(for section: Section<CodingWithWolves>, context: PublishingContext<CodingWithWolves>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: section, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent()
                    SiteFooter(context: context)
                }
            )
        }
        
        func makeItemHTML(for item: Item<CodingWithWolves>, context: PublishingContext<CodingWithWolves>) throws -> HTML {
            let posts = context.allItems(
                sortedBy: \.date,
                order: .descending
            )
            
            let previousPost = posts.item(before: item)
            let nextPost = posts.item(after: item)
            
            return HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent {
                        Article {
                            PostHeader(post: item)
                            Div(item.content.body)
                            PostFooter(
                                previousPost: previousPost,
                                nextPost: nextPost)
                        }
                        .attribute(named: "role", value: "main")
                        .class("post-details__container")
                    }
                    SiteFooter(context: context)
                }
            )
        }
        
        func makePageHTML(for page: Page, context: PublishingContext<CodingWithWolves>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent {
                        PageHeader(
                            title: page.content.title,
                            subtitle: page.description)
                        Div(page.body)
                    }
                    SiteFooter(context: context)
                }
            )
        }
        
        func makeTagListHTML(for page: TagListPage, context: PublishingContext<CodingWithWolves>) throws -> HTML? {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent()
                    SiteFooter(context: context)
                }
            )
        }
        
        func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<CodingWithWolves>) throws -> HTML? {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent()
                    SiteFooter(context: context)
                }
            )
        }
        
        
    }
}
