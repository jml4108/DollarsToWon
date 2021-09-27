//
//  ViewController.swift
//  DollarsToWon
//
//  Created by jmlee on 2020/11/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    // MARK: -Property
    
    let url = ""
    var flag = "Dollar"
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var txtMoney: UITextField!
    @IBOutlet weak var btnMoney: UIButton!
    @IBOutlet var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        //api
    }
    @IBAction func btnMoney(_ sender: UIButton) {
        if txtMoney.text == "" {
            print("Input Error")
            lblResult.text = "Input Error"
        } else if flag == "Dollar" {
            var money : Double = 0
            money = 1100 * Double(txtMoney.text!)!
            lblResult.text = String(format: "%.2f", money) + " Won"
        } else if flag == "Won" {
            var money : Double = 0
            money = (1 / 1100) * Double(txtMoney.text!)!
            lblResult.text = String(format: "%.2f", money) + " Dollar"
        }
    }
    
    
    @IBAction func btnChange(_ sender: UIButton) {
        switch flag {
        case "Dollar":
            lblTitle.text = "Won To Dollar"
            lblMoney.text = "Won"
            btnMoney.setTitle("Won To Dollar", for: .normal)
        case "Won":
            lblTitle.text = "Dollar To Won"
            lblMoney.text = "Dollar"
            btnMoney.setTitle("Dollar To Won", for: .normal)
        default:
            break
        }
        if flag == "Dollar" {flag = "Won"}
        else {flag = "Dollar"}
    }
}

