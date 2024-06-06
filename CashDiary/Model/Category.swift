//
//  Category.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import Foundation

enum Category: String, CaseIterable {
    case food = "Food"
    case transport = "Transport"
    case entertainment = "Entertainment"
    case shopping = "Shopping"
    case health = "Health"
    case utility = "Utility"
    case housing = "Housing"
    case investment = "Investment"
    case business = "Business"
    case others = "Others"
}

extension Category: Identifiable {
    var id: String { rawValue }
}
