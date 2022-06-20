//
//  OpenSourceOption.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import Foundation

public struct OpenSourceOption {
    public var navigationTitleEmoji: String
    public var navigationTitle: String
    public var rowEmoji: String
    public var deprecatedText: String
    public var rowTrailingType: TrailingType
    
    public enum TrailingType: String {
        case empty = "empty"
        case chevronForward = "chevron.forward"
    }
    
    public init(
        navigationTitleEmoji: String = "",
        navigationTitle: String = "",
        rowEmoji: String = "",
        deprecatedText: String = "",
        rowTrailingType: TrailingType = .empty
    ) {
        self.navigationTitleEmoji = navigationTitleEmoji
        self.navigationTitle = navigationTitle
        self.rowEmoji = rowEmoji
        self.deprecatedText = deprecatedText
        self.rowTrailingType = rowTrailingType
    }
}
