//
//  TransactionsListView.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI
import SwiftData
import SwipeActions

struct TransactionsListView: View {
    @Environment(\.modelContext) private var context
    
    @State var editTransaction: Transaction?
    
    @Query(animation: .snappy) private var transactions: [Transaction]
    
    init(sortBy: SortBy, orderBy: OrderBy) {
        let order: SortOrder = orderBy == .ascending ? .forward : .reverse
        
        _transactions = Query(sort: [
            sortBy == .amount ? SortDescriptor(\Transaction.amount, order: order)
                : SortDescriptor(\Transaction.date, order: order)
        ], animation: .snappy)
    }
    
    var body: some View {
        VStack(spacing: 15) {
            ForEach(transactions) { transaction in
                SwipeView {
                    Button(action: {
                        self.editTransaction = transaction
                    }) {
                        GroupBox {
                            HStack {
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(transaction.title).font(.headline)
                                    Text(transaction.note).font(.caption)
                                }
                                Spacer()
                                VStack(alignment: .trailing, spacing: 5) {
                                    Text(transaction.amountText).font(.headline)
                                    Text(transaction.dateText).font(.caption)
                                }
                            }
                            .lineLimit(1)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                } trailingActions: { _ in
                    SwipeAction("Delete", backgroundColor: .red) {
                        context.delete(transaction)
                    }.foregroundColor(.white)
                }
                
            }
            //.onDelete(perform: onDelete)
            .sheet(item: $editTransaction, onDismiss: {
                self.editTransaction = nil
            }) { transaction in
                AddEditTransactionView(editTransaction: transaction)
            }
        }
    }
    
    func onDelete(with indexSet: IndexSet) {
        indexSet.forEach { index in
            let transaction = transactions[index]
            context.delete(transaction)
        }
    }
}

#Preview {
    TransactionsListView(sortBy: .date, orderBy: .descending)
}
