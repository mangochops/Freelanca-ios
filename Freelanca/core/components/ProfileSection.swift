//
//  ProfileSection.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ProfileSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                .tracking(0.5)
            
            VStack(spacing: 0) {
                content
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.02), radius: 10, y: 5)
        }
    }
}

#Preview {
    ProfileSection(title: "Account Information") {
            Text("Sample Content")
                .padding()
        }
        .padding() // Added to show the shadow better
        .background(Color(hex: "#F9F9FF"))
}
