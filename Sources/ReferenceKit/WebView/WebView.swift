//
//  WebView.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private var webView: WKWebView
    private var urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        self.webView = WKWebView()
    }
    
    func makeUIView(context: Context) -> WKWebView {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        } else {
            let url = URL(string: "https://github.com/BoilerSwift/ReferenceKit")
            let request = URLRequest(url: url!)
            webView.load(request)
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
}

