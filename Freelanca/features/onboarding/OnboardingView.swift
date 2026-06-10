//
//  OnboardingView.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding = false
    
    let pages = [
        OnboardingData(
            title: "Get Paid with Confidence",
            description: "Your earnings are held in a secure, neutral escrow account the moment a contract starts. Funds are only released once you've delivered the work and it's approved.",
            image: "secure_escrow_illustration", // Replace with your asset name
            badgeText: "SECURE ESCROW"
        ),
        OnboardingData(
            title: "Milestones Made Simple",
            description: "Break your projects into manageable steps and track progress in real-time.",
            image: "smart_contracts_illustration", // Replace with your asset name
            badgeText: nil
        ),
        OnboardingData(
            title: "Your Wallet, Simplified",
            description: "Manage your earnings, withdrawals, and escrow balance all in one place.",
            image: "wallet_simplified_illustration", // Replace with your asset name
            badgeText: nil
        )
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient/Color
                Color(hex: "#F9F9FF").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Freelanca")
                            .font(.custom("LibreCaslonText-Bold", size: 24))
                            .foregroundColor(Color(hex: "#0A1B2F"))
                        Spacer()
                        Button("Skip") {
                            // Skip logic
                        }
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 10)
                    
                    TabView(selection: $currentPage) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            OnboardingPageView(data: pages[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    // Page Indicator
                    HStack(spacing: 8) {
                        ForEach(0..<pages.count, id: \.self) { i in
                            Capsule()
                                .fill(currentPage == i ? Color(hex: "#0A1B2F") : Color(hex: "#0A1B2F").opacity(0.2))
                                .frame(width: currentPage == i ? 24 : 8, height: 8)
                                .animation(.spring(), value: currentPage)
                        }
                    }
                    .padding(.bottom, 32)
                    
                    // Action Button
                    NavigationLink(destination: RoleSelectionView()) { // Replace with actual destination
                        HStack {
                            Text(currentPage == 2 ? "GET STARTED" : "NEXT")
                                .font(.system(size: 16, weight: .bold))
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(Color(hex: "#0A1B2F"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .background(Color(hex: "#D1FF3F")) // Brand Lime Green
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}
struct OnboardingPageView: View {
    let data: OnboardingData
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            // Image/Illustration Area
            ZStack(alignment: .bottomTrailing) {
                // Background shape/Illustration
                RoundedRectangle(cornerRadius: 32)
                    .fill(Color.white)
                    .aspectRatio(1, contentMode: .fit)
                    .shadow(color: Color.black.opacity(0.03), radius: 20, x: 0, y: 10)
                    .overlay(
                        // Placeholder for your high-fidelity asset
                        Image(systemName: data.image)
                            .resizable()
                            .scaledToFit()
                            .padding(60)
                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.1))
                    )
                
                if let badge = data.badgeText {
                    HStack {
                        Image(systemName: "checkmark.shield.fill")
                        Text(badge)
                            .font(.system(size: 12, weight: .bold))
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color(hex: "#D1FF3F"))
                    .cornerRadius(12)
                    .offset(x: -20, y: -20)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text(data.title)
                    .font(.custom("LibreCaslonText-Bold", size: 32))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: "#0A1B2F"))
                    .lineLimit(2)
                
                Text(data.description)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.7))
                    .lineSpacing(4)
                    .padding(.horizontal, 12)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
    }
}

struct OnboardingData {
    let title: String
    let description: String
    let image: String
    let badgeText: String?
}

// Color Hex Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }}
#Preview {
    OnboardingView()
}
