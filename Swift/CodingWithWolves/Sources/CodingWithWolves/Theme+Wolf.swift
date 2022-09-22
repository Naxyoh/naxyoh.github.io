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
                        HomeHeader(context: context)
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
            HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site),
                .body {
                    SiteHeader(context: context)
                    BodyContent {
                        Article {
                            Div(item.content.body)
                        }
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
                    BodyContent(page.body)
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
