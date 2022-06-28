//
//  OpenSourceView.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import SwiftUI

public struct OpenSourceView: View {
    
    public var navigationTitle: String
    public var items: [OpenSourceItem]
    public var deprecatedTitle: String
    public var trailingType: TrailingType
    
    public enum TrailingType: String {
        case empty = "empty"
        case chevronForward = "chevron.forward"
    }
    
    fileprivate var sortedItems: [OpenSourceItem] {
        return items
            .filter { $0.deprecated }
            .sorted { $0.url < $1.url }
        + items
            .filter { !$0.deprecated }
            .sorted { $0.url < $1.url }
    }
    
    public init(
        navigationTitle: String = "💡Used OpenSource",
        items: [OpenSourceItem],
        deprecatedTitle: String = "deprecated",
        trailingType: TrailingType = .empty
    ) {
        self.navigationTitle = navigationTitle
        self.items = items
        self.trailingType = trailingType
        self.deprecatedTitle = deprecatedTitle
    }
    
    public var body: some View {
        List {
            ForEach(sortedItems, id: \.self) { item in
                ZStack(alignment: .leading) {
                    NavigationLink {
                        // TODO: WebView
                        WebView(item.url)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        EmptyView()
                    }
                    .opacity(0)
                    
                    HStack {
                        Text(item.title)
                        
                        if !item.deprecated {
                            Text(deprecatedTitle)
                                .font(.caption2)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                        }
                    }
                }
                .foregroundColor(
                    item.deprecated
                    ? Color.primary
                    : Color.secondary
                )
            }
        }
        .listStyle(.plain)
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct OpenSourceView_Previews: PreviewProvider {
    static let items: [OpenSourceItem] = [
        OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
        OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
        OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
        OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)
    ]
    static var previews: some View {
        NavigationView {
            OpenSourceView(items: items, trailingType: .empty)
                .preferredColorScheme(.dark)
        }
        NavigationView {
            OpenSourceView(items: items, trailingType: .chevronForward)
        }
    }
}
