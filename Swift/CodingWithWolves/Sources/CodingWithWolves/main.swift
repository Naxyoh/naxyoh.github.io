import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct CodingWithWolves: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        let subtitle: String
        let wordCount: Int
        let preview: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://codingwithwolves.com")!
    var name = "CodingWithWolves"
    var description = "A description of CodingWithWolves"
    var language: Language { .french }
    var imagePath: Path? { nil }
}

let plugins: [Plugin<CodingWithWolves>] = []
let indentation: Indentation.Kind? = nil
let additionalSteps: [PublishingStep<CodingWithWolves>] = []
let rssFeedSections: Set<CodingWithWolves.SectionID> = Set(CodingWithWolves.SectionID.allCases)
let rssFeedConfig: RSSFeedConfiguration? = .default
let deploymentMethod: DeploymentMethod<CodingWithWolves>? = .gitHub("Naxyoh/naxyoh.github.io.git", useSSH: true)

try CodingWithWolves()
    .publish(
        using: [
            .group(plugins.map(PublishingStep.installPlugin)),
            .optional(.copyResources()),
            .addMarkdownFiles(),
            .sortItems(by: \.date, order: .descending),
            .group(additionalSteps),
            .generateHTML(withTheme: .wolf, indentation: indentation),
            .unwrap(rssFeedConfig) { config in
                .generateRSSFeed(
                    including: rssFeedSections,
                    config: config
                )
            },
            .generateSiteMap(indentedBy: indentation),
            .unwrap(deploymentMethod, PublishingStep.deploy)
        ]
    )
