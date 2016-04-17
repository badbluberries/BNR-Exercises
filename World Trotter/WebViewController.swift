//
//  WebViewController.swift
//  World Trotter
//
//  Created by Colin McKinstry on 12/04/2016.
//  Copyright © 2016 Allen McKinstry. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        let url = NSURL(string: "https://www.youtube.com/watch?v=VGsrMaxx8N4")
        let req = NSURLRequest(URL: url!)
        webView.loadRequest(req)
        view = webView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WebViewController loaded its view.")
    }
    
}