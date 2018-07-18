//
//  CreditsViewController.swift
//  Wheather App 2
//
//  Created by Mansur Muaz  Ekici on 18.07.2018.
//  Copyright © 2018 Adesso. All rights reserved.
//

import UIKit
import WebKit

class CreditsViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
    }
    
    func loadWebView() {
        
        webView.navigationDelegate = self
        
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
