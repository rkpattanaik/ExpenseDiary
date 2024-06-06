//
//  Sorting.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import Foundation
import SwiftData

enum SortBy: String, CaseIterable, Identifiable {
    case date
    case amount
    
    var id: String { rawValue }
}

enum OrderBy: String, CaseIterable, Identifiable {
    case ascending
    case descending
    
    var id: String { rawValue }
}
