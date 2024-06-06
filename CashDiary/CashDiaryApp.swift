//
//  CashDiaryApp.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI
import SwiftData

@main
struct CashDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(for: Transaction.self)
    }
}
