//
//  File.swift
//  
//
//  Created by Yoan Smit on 09/09/2022.
//

import Foundation

extension DateFormatter {
    
    static var wolf: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }()
    
}
