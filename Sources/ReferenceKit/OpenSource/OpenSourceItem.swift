//
//  OpenSource.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import Foundation

public struct OpenSourceItem: Hashable {
    public var urlString: String
    public var isDeprecated: Bool
    var name: String { urlString.components(separatedBy: "/").last ?? "" }
    
    public init(_ urlString: String, isDeprecated: Bool = true) {
        self.urlString = urlString
        self.isDeprecated = isDeprecated
    }
}
