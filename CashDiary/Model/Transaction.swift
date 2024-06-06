//
//  Transaction.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import Foundation
import SwiftData

@Model
class Transaction: Identifiable {
    @Attribute(.unique) var id: String
    var title: String
    var note: String
    var amount: Double
    var date: Date
    
    init(title: String, note: String, amount: Double, date: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.note = note
        self.amount = amount
        self.date = date
    }
    
    @Transient
    var dateText: String {
        Utils.dateFormatter.string(from: date)
    }
    
    @Transient
    var amountText: String {
        Utils.currencyNumberFormatter.string(from: NSNumber(value: amount)) ?? ""
    }
}
