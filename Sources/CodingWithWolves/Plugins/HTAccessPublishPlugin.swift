//
//  File.swift
//  
//
//  Created by Yoan Smit on 12/11/2022.
//

import Foundation
import Publish

public extension Plugin {
    
    /// Returns a plugin that copies a .htaccess file from the website's resources directory to the website's
    /// output directory.
    static func addHTAccess() -> Self {
        Plugin(name: "Copy from existing .htaccess file in the Resources directory") { context in
            let file = try context.file(at: "Resources/.htaccess")
            
            let fileContent = try file.readAsString()
            
            guard !fileContent.isEmpty else { throw CNAMEGenerationError.listEmpty }
            
            try context.copyFileToOutput(from: "Resources/.htaccess")
        }
    }
}
