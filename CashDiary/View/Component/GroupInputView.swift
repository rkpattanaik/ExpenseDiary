//
//  GroupInputView.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI

struct GroupInputView<Content: View>: View {
    let title: String
    let content: Content
    
    init(_ title: String, @ViewBuilder _ content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(title)
                .font(.caption)
                .foregroundStyle(.gray)
                .hSpacing(.leading)
            
            GroupBox {
                content
            }
        })
    }
}
