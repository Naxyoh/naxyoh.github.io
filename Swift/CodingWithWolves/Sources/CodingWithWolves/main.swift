import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct CodingWithWolves: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        let subtitle: String
        let preview: String
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://codingwithwolves.com")!
    var name = "CodingWithWolves"
    var description = "A description of CodingWithWolves"
    var language: Language { .french }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try CodingWithWolves().publish(withTheme: .wolf)