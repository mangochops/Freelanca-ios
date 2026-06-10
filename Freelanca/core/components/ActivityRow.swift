//
//  ActivityRow.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ActivityRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String
    var amount: String? = nil
    var amountColor: Color = Color(hex: "#0A1B2F")
    var showArrow: Bool = false
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(iconColor == Color(hex: "#D1FF3F") ? Color(hex: "#D1FF3F") : Color(hex: "#EFF4FF"))
                    .frame(width: 44, height: 44)
                Image(systemName: icon)
                    .foregroundColor(Color(hex: "#0A1B2F"))
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1B2F"))
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.5))
            }
            
            Spacer()
            
            if let amount = amount {
                Text(amount)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(amountColor)
            }
            
            if showArrow {
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.3))
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.02), radius: 5, y: 2)
    }
}


#Preview {
    ActivityRow(icon: "house", iconColor: Color.red, title: "test", subtitle: "test")
}
