//
//  WebView.swift
//  ReferenceKit
//
//  Created by Hamlit Jason on 2022/06/20.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    fileprivate var webView = WKWebView()
    fileprivate var activityIndicator = UIActivityIndicatorView() {
        didSet {
            activityIndicator.isHidden = !activityIndicator.isAnimating 
        }
    }
    
    fileprivate var url: String
    
    init(_ url: String) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) { }
}

extension WebView {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // MARK: - WKNavigationDelegate, WKUIDelegate
        func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
            webView.reload()
        }

        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            
            parent.activityIndicator.startAnimating()
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
            parent.activityIndicator.stopAnimating()
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {

            parent.activityIndicator.stopAnimating()
        }

        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("❗️ \(#function): - \(error.localizedDescription)")
        }
    }
}
