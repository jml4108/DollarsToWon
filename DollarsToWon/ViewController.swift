//
//  ViewController.swift
//  DollarsToWon
//
//  Created by jmlee on 2020/11/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet var txtDollars: UITextField!
    @IBOutlet var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoney(_ sender: UIButton) {
        if txtDollars.text == "" {
            print("Input Error")
            lblResult.text = "Input Error"
        } else {
            var money : Int = 0
            money = 1100 * Int(txtDollars.text!)!
            lblResult.text = String(money) + " Won"
        }
    }
}

