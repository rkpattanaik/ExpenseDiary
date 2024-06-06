//
//  ContentView.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI

struct DashboardView: View {
    @State var showAddTransactionView: Bool = false
    @State private var sortBy = SortBy.date
    @State private var orderBy = OrderBy.descending
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    SortingView(sortBy: $sortBy, orderBy: $orderBy)
                    TransactionsListView(sortBy: sortBy, orderBy: orderBy).padding(.vertical)
                }
                .padding(.horizontal)
            }
            .sheet(isPresented: $showAddTransactionView, onDismiss: {
                self.showAddTransactionView = false
            }) {
                AddEditTransactionView()
            }
            .navigationBarItems(trailing: Button(action: onAddButtonClicked) { Text("Add") })
            .navigationBarTitle("Expense Diary")
        }
    }
    
    func onAddButtonClicked() {
        showAddTransactionView = true
    }
}

#Preview {
    DashboardView()
}
