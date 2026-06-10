//
//  BalanceItem.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct BalanceItem: View {
    let label: String
    let amount: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Color.white.opacity(0.4))
            Text(amount)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    BalanceItem(label: "Money", amount: "40000")
}
