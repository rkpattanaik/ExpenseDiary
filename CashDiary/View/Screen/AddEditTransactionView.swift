//
//  AddEditTransactionView.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI

struct AddEditTransactionView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
    var editTransaction: Transaction?
    
    @State private var title: String = ""
    @State private var note: String = ""
    @State var amount: Double = 0
    @State private var date: Date = .now
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 15) {
                    GroupInputView("Title") {
                        TextField("Enter Title", text: $title)
                            .autocorrectionDisabled(true)
                    }
                    
                    GroupInputView("Note") {
                        TextField("Enter Short Description", text: $note)
                            .autocorrectionDisabled(true)
                    }
                    
                    GroupInputView("Amount") {
                        TextField("Amount", value: $amount, formatter: Utils.currencyNumberFormatter)
                            .keyboardType(.numbersAndPunctuation)
                    }

                    GroupInputView("Date") {
                        DatePicker("", selection: $date, displayedComponents: [.date])
                            .datePickerStyle(.graphical)
                            .padding(.horizontal, -12)
                            .padding(.vertical, -16)
                    }
                    
                }
                .padding(15)
            }
            
            .navigationBarItems(
                leading: Button(action: onCancelTapped) { Text("Cancel") },
                trailing: Button(action: onSaveTapped) { Text("Save") }
            )
            .navigationBarTitle("\(editTransaction == nil ? "Add" : "Edit") Transaction", displayMode: .inline)
        }.onAppear(perform: {
            if let editTransaction {
                title = editTransaction.title
                note = editTransaction.note
                date = editTransaction.date
                amount = editTransaction.amount
            }
        })
    }
    
    func onCancelTapped() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func onSaveTapped() {
        if editTransaction != nil {
            editTransaction?.title = title
            editTransaction?.note = note
            editTransaction?.amount = amount
            editTransaction?.date = date
        } else {
            let transaction = Transaction(title: title, note: note, amount: amount, date: date)
            context.insert(transaction)
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
    
    @ViewBuilder
    func CustomTextField(_ title: String, _ hint: String, value: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            GroupBox {
                TextField(hint, text: value)
            }
        })
    }
}

#Preview {
    AddEditTransactionView()
}
