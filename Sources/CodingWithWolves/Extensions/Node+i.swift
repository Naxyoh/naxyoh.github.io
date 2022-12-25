//
//  Node+i.swift
//  
//
//  Created by Yoan Smit on 21/09/2022.
//

import Publish
import Plot


extension Node where Context == HTML.BodyContext {
 
    /// Add a `<i>` HTML element within the current context.
    /// - parameter nodes: The element's attributes and child elements.
    static func i(_ nodes: Node<HTML.BodyContext>...) -> Node {
        .element(named: "i", nodes: nodes)
    }
    
}

extension ElementDefinitions {
    /// Definition for the `<i>` element.
    public enum I: ElementDefinition { public static var wrapper = Node.i }
}

/// A container component that's rendered using the `<i>` element.
public typealias I = ElementComponent<ElementDefinitions.I>
