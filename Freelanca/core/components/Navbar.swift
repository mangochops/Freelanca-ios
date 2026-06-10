//
//  Navbar.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct Navbar: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        HStack {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Button(action: { selectedTab = tab }) {
                    VStack(spacing: 4) {
                        if selectedTab == tab {
                            ZStack {
                                Capsule().fill(Color(hex: "#D1FF3F")).frame(width: 54, height: 32)
                                Image(systemName: tab.icon).font(.system(size: 18)).foregroundColor(Color(hex: "#0A1B2F"))
                            }
                        } else {
                            Image(systemName: tab.icon).font(.system(size: 18)).foregroundColor(Color(hex: "#0A1B2F").opacity(0.4)).frame(height: 32)
                        }
                        Text(tab.rawValue).font(.system(size: 10, weight: .medium)).foregroundColor(selectedTab == tab ? Color(hex: "#0A1B2F") : Color(hex: "#0A1B2F").opacity(0.4))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.horizontal, 12).padding(.top, 12).padding(.bottom, 24)
        .background(Color.white)
//        .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
        .shadow(color: Color.black.opacity(0.05), radius: 10, y: -5)
    }
}

#Preview {
    Navbar(selectedTab: .constant(.home))
            .background(Color(hex: "#F9F9FF"))
}
