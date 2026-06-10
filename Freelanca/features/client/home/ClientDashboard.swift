//
//  ClientDashboard.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ClientDashboard: View {
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
                            
                            // Balance Card (Client Focus)
                            VStack(alignment: .leading, spacing: 20) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("TOTAL ESCROW BALANCE")
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundColor(Color.white.opacity(0.6))
                                    Text("$12,480.00")
                                        .font(.system(size: 38, weight: .bold))
                                        .foregroundColor(Color(hex: "#D1FF3F"))
                                }
                                
                                HStack(spacing: 32) {
                                    BalanceItem(label: "IN ESCROW", amount: "$8,200.00")
                                    BalanceItem(label: "AVAILABLE", amount: "$4,280.00")
                                    Spacer()
                                    Image(systemName: "wallet.pass.fill")
                                        .font(.system(size: 44))
                                        .foregroundColor(Color.white.opacity(0.15))
                                }
                            }
                            .padding(28)
                            .frame(maxWidth: .infinity)
                            .background(Color(hex: "#1A1C1E"))
                            .cornerRadius(24)
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            
                            // Quick Actions (RBAC: Client Context)
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Quick Actions")
                                    .font(.custom("LibreCaslonText-Bold", size: 20))
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                
                                HStack(spacing: 12) {
                                    // Hire Talent Primary Card
                                    Button(action: {}) {
                                        VStack(alignment: .leading, spacing: 32) {
                                            Image(systemName: "person.badge.plus")
                                                .font(.system(size: 28))
                                            Text("Hire Freelancer")
                                                .font(.system(size: 14, weight: .bold))
                                        }
                                        .foregroundColor(Color(hex: "#D1FF3F"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(20)
                                        .background(Color(hex: "#1A1C1E"))
                                        .cornerRadius(20)
                                    }
                                    
                                    VStack(spacing: 12) {
                                        ActionSmallCard(icon: "university-bank", title: "Deposit Funds")
                                        ActionSmallCard(icon: "checkmark.shield", title: "Release Payment")
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                            }
                            .padding(.horizontal, 24)
                            
                            // Recent Activity
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Text("Recent Activity")
                                        .font(.custom("LibreCaslonText-Bold", size: 20))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    Spacer()
                                    Button("View All") { }
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                }
                                
                                VStack(spacing: 12) {
                                    ActivityRow(
                                        icon: "checkmark.circle.fill",
                                        iconColor: Color(hex: "#D1FF3F"),
                                        title: "Milestone Released",
                                        subtitle: "Mobile App UI Design • Just now",
                                        amount: "+$2,400"
                                    )
                                    
                                    ActivityRow(
                                        icon: "banknote.fill",
                                        iconColor: Color(hex: "#EFF4FF"),
                                        title: "Funded by Client",
                                        subtitle: "API Integration • 2 hours ago",
                                        amount: "$1,850",
                                        amountColor: Color(hex: "#0A1B2F")
                                    )
                                }
                            }
                            .padding(.horizontal, 24)
                            
                            // Security Banner
                            HStack(spacing: 16) {
                                Image(systemName: "shield.checkered")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Identity Verified")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    Text("Your account is fully compliant and secure.")
                                        .font(.system(size: 12))
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                }
                                Spacer()
                            }
                            .padding(16)
                            .background(Color(hex: "#D1FF3F").opacity(0.1))
                            .cornerRadius(16)
                            .padding(.horizontal, 24)
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
















#Preview {
    ClientDashboard()
}
