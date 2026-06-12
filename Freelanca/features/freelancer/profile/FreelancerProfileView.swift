//
//  ClientProfileView.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct FreelancerProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(hex: "#F9F9FF").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Top App Bar
                    HStack {
                        HStack(spacing: 8) {
                            Image(systemName: "shield.fill")
                                .font(.system(size: 20))
                                .foregroundColor(Color(hex: "#0A1B2F"))
                            Text("Freelanca")
                                .font(.custom("LibreCaslonText-Bold", size: 24))
                                .foregroundColor(Color(hex: "#0A1B2F"))
                        }
                        Spacer()
                        Image("user_avatar") // Replace with actual asset placeholder
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 32) {
                            
                            // Profile Header
                            VStack(spacing: 16) {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("profile_large") // Replace with actual asset
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
                                    
                                    ZStack {
                                        Circle()
                                            .fill(Color(hex: "#D1FF3F"))
                                            .frame(width: 32, height: 32)
                                        Image(systemName: "checkmark.seal.fill")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                    }
                                    .offset(x: -5, y: -5)
                                }
                                
                                VStack(spacing: 4) {
                                    Text("Alex Rivera")
                                        .font(.custom("LibreCaslonText-Bold", size: 32))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    Text("Senior Full-Stack Developer")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                }
                                
                                HStack(spacing: 12) {
                                    HStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                        Text("4.9")
                                            .font(.system(size: 14, weight: .bold))
                                    }
                                    Circle().fill(Color(hex: "#0A1B2F").opacity(0.2)).frame(width: 4, height: 4)
                                    Text("124 Reviews")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(Color(hex: "#EFF4FF"))
                                .cornerRadius(20)
                            }
                            .padding(.top, 24)
                            
                            // Core Stats
                            HStack(spacing: 16) {
                                StatCard(title: "Active Escrows", value: "04", valueColor: Color(hex: "#0A1B2F"))
                                StatCard(title: "Completion Rate", value: "98%", valueColor: Color(hex: "#10B981"))
                            }
                            .padding(.horizontal, 24)
                            
                            // Menu Sections
                            VStack(spacing: 32) {
                                ProfileSection(title: "Payment Methods") {
                                    MenuRow(icon: "creditcard", title: "Payout Settings", subtitle: "Direct Deposit, PayPal")
                                    MenuRow(icon: "list.bullet.rectangle", title: "Wallet Transactions", subtitle: "View history and tax docs")
                                }
                                
                                ProfileSection(title: "Account Settings") {
                                    MenuRow(icon: "person", title: "Personal Information", subtitle: "Email, Phone, Address")
                                    MenuRow(icon: "bell", title: "Notification Preferences", subtitle: "Alerts for escrows and chats")
                                }
                                
                                ProfileSection(title: "Security") {
                                    MenuRow(icon: "lock", title: "Password & 2FA", subtitle: "Manage your credentials")
                                }
                                
                                ProfileSection(title: "Support") {
                                    MenuRow(icon: "questionmark.circle", title: "Help Center", subtitle: "Guides and FAQs")
                                    MenuRow(icon: "bubble.left", title: "Contact Support", subtitle: "Live chat with our team")
                                }
                            }
                            .padding(.horizontal, 24)
                            
                            // Logout Button
                            Button(action: {}) {
                                HStack(spacing: 12) {
                                    Image(systemName: "rectangle.portrait.and.arrow.right")
                                    Text("Logout")
                                        .font(.system(size: 16, weight: .bold))
                                }
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 18)
                                .background(Color.white)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color.red.opacity(0.1), lineWidth: 1)
                                )
                            }
                            .padding(.horizontal, 24)
                            
                            Text("Freelanca v2.4.0 (Enterprise)")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.3))
                                .padding(.bottom, 120)
                        }
                    }
                }
                
                // Bottom Tab Bar
                
            }
        }
    }
}

// MARK: - Subviews

struct StatCard: View {
    let title: String
    let value: String
    let valueColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
            Text(value)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(valueColor)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.02), radius: 10, y: 5)
    }
}














#Preview {
    FreelancerProfileView()
}
