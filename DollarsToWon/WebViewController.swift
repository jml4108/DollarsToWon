//
//  WebViewController.swift
//  DollarsToWon
//
//  Created by jmlee on 2020/12/04.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goNaver(_ sender: UIButton) {
        guard let url = URL(string: "https://google.com") else {return}
        let request = URLRequest(url: url as URL)
        webView?.load(request)
    }
    

    
}
