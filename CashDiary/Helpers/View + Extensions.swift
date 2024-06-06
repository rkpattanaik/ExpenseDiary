//
//  View + Extensions.swift
//  CashDiary
//
//  Created by Rajesh Pattanaik on 06/06/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func hSpacing(_ alignment: Alignment = .center) -> some View {
        self
        .frame(maxWidth: .infinity, alignment: alignment)
    }
}
