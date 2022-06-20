//
//  OpenSourceView.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import SwiftUI

public struct OpenSourceView: View {
    
    /// 외부 사용자에게 보여질 items
    public var items: [OpenSourceItem]
    public var option: OpenSourceOption
    
    private var sortedItems: [OpenSourceItem] {
        return items
            .filter { $0.isDeprecated }
            .sorted { $0.urlString.components(separatedBy: "/").last ?? "" < $1.urlString.components(separatedBy: "/").last ?? "" }
        + items
            .filter { !$0.isDeprecated }
            .sorted { $0.urlString.components(separatedBy: "/").last ?? "" < $1.urlString.components(separatedBy: "/").last ?? "" }
    }
    
    init(items: [OpenSourceItem], option: OpenSourceOption) {
        self.items = items
        self.option = option
    }
    
    public var body: some View {
        List {
            ForEach(sortedItems, id: \.self) { item in
                HStack {
                    ZStack(alignment: .leading) {
                        NavigationLink {
                            WebView(urlString: item.urlString)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        HStack {
                            Text(option.rowEmoji + " " + item.name)
                            
                            if !item.isDeprecated {
                                Text(option.deprecatedText)
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
                        item.isDeprecated
                        ? Color.primary
                        : Color.secondary
                    )
                    
                    Spacer()
                    
                    if option.rowTrailingType != .empty {
                        Image(systemName: option.rowTrailingType.rawValue)
                            .foregroundColor(Color.gray)
                    }
                }
                
            }
        }
        .listStyle(.plain)
        .navigationTitle(option.navigationTitleEmoji + " " + option.navigationTitle)
        .navigationBarTitleDisplayMode(.automatic)
    }
}
