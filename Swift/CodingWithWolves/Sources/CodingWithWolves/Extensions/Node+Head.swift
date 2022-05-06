//
//  File.swift
//  
//
//  Created by Yoan Smit on 07/05/2022.
//

import Publish
import Plot

private struct Favicon {
    let relationship: HTMLLinkRelationship
    let path: Path
    var hasSizes: Bool = false
}

extension Node where Context == HTML.DocumentContext {
    
    private static let stylesheetPaths: [Path] = [
        "/stylesheets/components.css",
        "/stylesheets/resets.css",
    ]
    
    private static let favicons: [Favicon] = [
        Favicon(relationship: .icon, path: "/favicon.ico", hasSizes: true),
        Favicon(relationship: .appleTouchIcon, path: "/favicon/apple-touch-icon.png"),
        Favicon(relationship: .manifest, path: "/favicon/site.webmanifest"),
    ]
    
    /// Add an HTML `<head>` tag within the current context, based
    /// on inferred information from the current location and `Website`
    /// implementation.
    /// - parameter location: The location to generate a `<head>` tag for.
    /// - parameter site: The website on which the location is located.
    /// - parameter titleSeparator: Any string to use to separate the location's
    ///   title from the name of the website. Default: `" | "`.
    /// - parameter stylesheetPaths: The paths to any stylesheets to add to
    ///   the resulting HTML page. Default: `styles.css`.
    /// - parameter rssFeedPath: The path to any RSS feed to associate with the
    ///   resulting HTML page. Default: `feed.rss`.
    /// - parameter rssFeedTitle: An optional title for the page's RSS feed.
    static func head<T: Website>(
        for location: Location,
        on site: T,
        titleSeparator: String = " | ",
        rssFeedPath: Path? = .defaultForRSSFeed,
        rssFeedTitle: String? = nil
    ) -> Node<HTML.DocumentContext> {
        var title = location.title

        if title.isEmpty {
            title = site.name
        } else {
            title.append(titleSeparator + site.name)
        }

        var description = location.description

        if description.isEmpty {
            description = site.description
        }

        return .head(
            .encoding(.utf8),
            .siteName(site.name),
            .url(site.url(for: location)),
            .title(title),
            .description(description),
            .twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
            .forEach(stylesheetPaths, { .stylesheet($0) }),
            .viewport(.accordingToDevice),
            .forEach(favicons, { .favicon($0) }),
            .unwrap(rssFeedPath, { path in
                let title = rssFeedTitle ?? "Subscribe to \(site.name)"
                return .rssFeedLink(path.absoluteString, title: title)
            }),
            .unwrap(location.imagePath ?? site.imagePath, { path in
                let url = site.url(for: path)
                return .socialImageLink(url)
            })
        )
    }
    
    
}

private extension Node where Context == HTML.HeadContext {
    static func favicon(_ favicon: Favicon) -> Node {
        if favicon.hasSizes {
            return .link(
                .rel(favicon.relationship),
                .href(favicon.path.string),
                .sizes("any")
            )
        } else {
            return .link(
                .rel(favicon.relationship),
                .href(favicon.path.string)
            )
        }
    }
}


