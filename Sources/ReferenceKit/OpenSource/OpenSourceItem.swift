//
//  OpenSource.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import Foundation

public struct OpenSourceItem: Hashable {
    
    public var title: String
    public var url: String
    public var deprecated: Bool
    
    public init(
        title: String,
        url: String,
        deprecated: Bool = false
    ) {
        self.title = title
        self.url = url
        self.deprecated = deprecated
    }
}
