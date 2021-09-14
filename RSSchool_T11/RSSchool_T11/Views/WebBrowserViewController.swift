//
//  WebBrowserViewController.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/11/21.
//

import UIKit
import WebKit

class WebBrowserViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()
    var websites = ["apple.com","wikipedia.org"]
    
    override func loadView() {
        webView.navigationDelegate = self
        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://" + websites[0])!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true

        if let navi = navigationController as? NavigationViewController {
            navi.configureWBNavigation(vc: self, targetToUpdate: webView)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        decisionHandler(.cancel)
    }
    
}
