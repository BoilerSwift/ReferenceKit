//
//  OpenSource.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import Foundation

public struct ReferenceItem: Hashable {
    
    /// item의 이름
    public var title: String
    /// item의 url
    public var url: String
    /// item의 deprecated 여부
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
