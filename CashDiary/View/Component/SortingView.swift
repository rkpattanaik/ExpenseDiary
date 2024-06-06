//
//  SortingView.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI

struct SortingView: View {
    @Binding var sortBy: SortBy
    @Binding var orderBy: OrderBy
    
    var body: some View {
        HStack {
            HStack {
                Text("Sort by")
                Picker(selection: $sortBy, label: Text("Sort by")) {
                    ForEach(SortBy.allCases) { value in
                        Image(systemName: value == .date ? "calendar" : "dollarsign.circle").tag(value)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Spacer()
            
            HStack {
                Text("Order by")
                Picker(selection: $orderBy, label: Text("Order by")) {
                    ForEach(OrderBy.allCases) { value in
                        Image(systemName: value == .ascending ? "arrow.up" : "arrow.down").tag(value)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .padding(0)
        .frame(height: 64)
    }
}

#Preview {
    SortingView(sortBy: .constant(.date), orderBy: .constant(.descending))
}

