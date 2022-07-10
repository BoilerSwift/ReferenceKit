//
//  OpenSourceView.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import SwiftUI

public struct ReferenceView: View {
    
    /// ReferenceView의 NavigationTitle에 들어갈 Text
    public var navigationTitle: String
    /// List에 보여질 items
    public var items: [ReferenceItem]
    /// deprecated된 item에 보여질 Text
    public var deprecatedTitle: String
    /// /// UITableViewCell.AccessoryType 과 동일
    public var trailingType: TrailingType
    
    public enum TrailingType: String {
        /// accessory에 아무것도 표시되지 않음
        case none = ""
        /// 새 컨텐츠를 표시하는 chevron 모양의 컨트롤
        case disclosureIndicator = "chevron.forward"
    }
    
    fileprivate var sortedItems: [ReferenceItem] {
        return items
            .filter { !$0.deprecated }
            .sorted { $0.url < $1.url }
        + items
            .filter { $0.deprecated }
            .sorted { $0.url < $1.url }
    }
    
    public init(
        navigationTitle: String = "💡Reference",
        items: [ReferenceItem],
        deprecatedTitle: String = "deprecated",
        trailingType: TrailingType = .disclosureIndicator
    ) {
        self.navigationTitle = navigationTitle
        self.items = items
        self.trailingType = trailingType
        self.deprecatedTitle = deprecatedTitle
    }
    
    public var body: some View {
        NavigationView {
            
            List {
                ForEach(sortedItems, id: \.self) { item in
                    ZStack(alignment: .leading) {
                        NavigationLink {
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
}

struct OpenSourceView_Previews: PreviewProvider {
    static let items: [ReferenceItem] = [
        ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
        ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
        ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
        ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)
    ]
    static var previews: some View {
        NavigationView {
            ReferenceView(items: items, trailingType: .none)
                .preferredColorScheme(.dark)
        }
        NavigationView {
            ReferenceView(items: items, trailingType: .disclosureIndicator)
        }
    }
}
