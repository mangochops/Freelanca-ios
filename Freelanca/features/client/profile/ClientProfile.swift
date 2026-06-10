//
//  ClientProfile.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ClientProfileView: View {
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
                        Image(systemName: "person.crop.circle.fill") // Placeholder for user profile photo
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.1))
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
                                    // Main Avatar Image
                                    ZStack {
                                        Circle()
                                            .fill(Color(hex: "#EFF4FF"))
                                            .frame(width: 120, height: 120)
                                        Image(systemName: "person.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(30)
                                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.2))
                                    }
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(color: Color.black.opacity(0.1), radius: 10, y: 5)
                                    
                                    // Status Indicator
                                    Circle()
                                        .fill(Color(hex: "#D1FF3F"))
                                        .frame(width: 28, height: 28)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                        .offset(x: -8, y: -8)
                                }
                                
                                VStack(spacing: 4) {
                                    Text("Alex Rivera")
                                        .font(.custom("LibreCaslonText-Bold", size: 32))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    Text("Mango Limited")
                                        .font(.system(size: 16, weight: .medium))
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                }
                                
                                HStack(spacing: 8) {
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color(hex: "#10B981"))
                                    Text("4.9")
                                        .font(.system(size: 14, weight: .bold))
                                    Text("•")
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.2))
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
                            
                            // Metrics Grid
                            HStack(spacing: 16) {
                                ProfileMetricCard(title: "Active Escrows", value: "4")
                                ProfileMetricCard(title: "Total Projects", value: "9", valueColor: Color(hex: "#10B981"))
                            }
                            .padding(.horizontal, 24)
                            
                            // Menu Sections
                            VStack(spacing: 32) {
                                ProfileSection(title: "Payment Methods") {
                                    MenuRow(icon: "creditcard", title: "Payment Settings", subtitle: "Direct Deposit, PayPal")
                                    MenuRow(icon: "list.bullet.rectangle", title: "Wallet Transactions", subtitle: "View history and tax docs", isLast: true)
                                }
                                
                                ProfileSection(title: "Account Settings") {
                                    MenuRow(icon: "person", title: "Personal Information", subtitle: "Email, Phone, Address")
                                    MenuRow(icon: "bell", title: "Notification Preferences", subtitle: "Alerts for escrows and chats", isLast: true)
                                }
                                
                                ProfileSection(title: "Security") {
                                    MenuRow(icon: "lock", title: "Password & 2FA", subtitle: "Manage your credentials", isLast: true)
                                }
                                
                                ProfileSection(title: "Support") {
                                    MenuRow(icon: "questionmark.circle", title: "Help Center", subtitle: "Guides and FAQs")
                                    MenuRow(icon: "bubble.left", title: "Contact Support", subtitle: "Live chat with our team", isLast: true)
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
                                .foregroundColor(Color(hex: "#B91C1C"))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 18)
                                .background(Color.white)
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(Color(hex: "#B91C1C").opacity(0.1), lineWidth: 1)
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

struct ProfileMetricCard: View {
    let title: String
    let value: String
    var valueColor: Color = Color(hex: "#0A1B2F")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
    ClientProfileView()
}
