//
//  NotificationCard.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct NotificationCard: View {
    let icon: String
    let title: String
    let message: String
    let time: String
    var isNew: Bool = false
    var actionTitle: String? = nil
    var isDestructive: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 16) {
                // Icon
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isDestructive ? Color.red.opacity(0.05) : Color(hex: "#EFF4FF"))
                        .frame(width: 48, height: 48)
                    Image(systemName: icon)
                        .foregroundColor(isDestructive ? .red : Color(hex: "#0A1B2F"))
                        .font(.system(size: 18))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color(hex: "#0A1B2F"))
                        Spacer()
                        Text(time)
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                        
                        if isNew {
                            Circle()
                                .fill(Color(hex: "#D1FF3F"))
                                .frame(width: 8, height: 8)
                        }
                    }
                    
                    Text(message)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                        .lineSpacing(2)
                }
            }
            
            if let action = actionTitle {
                Button(action: {}) {
                    Text(action)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(isDestructive ? .red : Color(hex: "#0A1B2F"))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(isDestructive ? Color.red.opacity(0.05) : (action == "View Wallet" ? Color(hex: "#D1FF3F") : Color(hex: "#EFF4FF")))
                        .cornerRadius(10)
                }
                .padding(.leading, 64)
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.02), radius: 10, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: "#0A1B2F").opacity(0.05), lineWidth: 1)
        )
    }
}

#Preview {
    NotificationCard(
            icon: "bell.fill",
            title: "New Proposal",
            message: "You have received a new proposal for your project.",
            time: "2m ago"
        )
        .padding()
        .background(Color(hex: "#F9F9FF"))
}
