//
//  SocialButton.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

struct socialButton: View {
    let title: String
    let icon: String
    let isDark: Bool // Changed from var to let for strictness
    
    var body: some View {
        Button(action: { }) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                Text(title)
            }
            .foregroundColor(isDark ? .white : .black)
            .frame(maxWidth: .infinity)
            .padding()
            .background(isDark ? Color.black : Color.gray.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// Preview should now work without the 'isDark' error if you cleaned the build
#Preview {
    VStack {
        socialButton(title: "GOOGLE", icon: "g.circle", isDark: false)
        socialButton(title: "APPLE", icon: "apple.logo", isDark: true)
    }
}
