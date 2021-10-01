//
//  ViewController.swift
//  DollarsToWon
//
//  Created by jmlee on 2020/11/22.
//

import Alamofire
import UIKit
import Foundation

class ViewController: UIViewController {
    // MARK: -Property
    
    var flag = "Dollar"
    
    let urlString = "http://api.exchangeratesapi.io/v1/latest?access_key=c692b7b897a4d8b6b625113cfaa84cdb&format=1"
    var exchangeRate: ExchangeRate?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblMoney: UILabel!
    @IBOutlet weak var txtMoney: UITextField!
    @IBOutlet weak var btnMoney: UIButton!
    @IBOutlet var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func getData() {
        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .success(let res):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    let json = try JSONDecoder().decode(ExchangeRate.self, from: jsonData)
                    self.exchangeRate = json
                }
                catch(let err) {
                    print(err)
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    @IBAction func btnMoney(_ sender: UIButton) {
        var money = exchangeRate?.rates.KRW ?? 1100.0
        if txtMoney.text == "" { lblResult.text = "Input Error" }
        switch flag {
        case "Dollar":
            money = money * Double(txtMoney.text!)!
            lblResult.text = String(format: "%.2f", money) + " Won"
        case "Won":
            money = (1 / money) * Double(txtMoney.text!)!
            lblResult.text = String(format: "%.2f", money) + " Dollar"
        default:
            break
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

