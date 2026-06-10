//
//  NotificationSection.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct NotificationSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                .tracking(1)
            
            VStack(spacing: 12) {
                content
            }
        }
    }
}

#Preview {
    NotificationSection(title: "RECENT NOTIFICATIONS") {
            Text("No new notifications")
                .font(.subheadline)
                .padding()
        }
        .padding()
}
