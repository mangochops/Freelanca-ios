//
//  MenuRow.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct MenuRow: View {
    let icon: String
    let title: String
    let subtitle: String
    var isLast: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "#EFF4FF"))
                        .frame(width: 44, height: 44)
                    Image(systemName: icon)
                        .foregroundColor(Color(hex: "#0A1B2F"))
                        .font(.system(size: 18))
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color(hex: "#0A1B2F"))
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.5))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.2))
            }
            .padding(20)
            
            if !isLast {
                Divider()
                    .padding(.leading, 80)
            }
        }
    }
}

#Preview {
    MenuRow(icon: "house", title: "test", subtitle: "test")
}
