//
//  ExchangeRate.swift
//  DollarsToWon
//
//  Created by 이정민 on 2021/09/28.
//

import Foundation

struct ExchangeRate: Codable {
    let rates: Rates
}

struct Rates: Codable {
    let KRW: Double?
}
