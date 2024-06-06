//
//  Utils.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import Foundation

struct Utils {
    
    static let currencyNumberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.isLenient = true
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter
    }()
}
