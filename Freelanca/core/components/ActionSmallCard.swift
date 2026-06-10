//
//  ActionSmallCard.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ActionSmallCard: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .bold))
            Text(title)
                .font(.system(size: 14, weight: .bold))
            Spacer()
        }
        .foregroundColor(Color(hex: "#0A1B2F"))
        .padding(20)
        .background(Color(hex: "#EFF4FF"))
        .cornerRadius(16)
    }
}

#Preview {
    ActionSmallCard(icon: "house", title: "test")
}
