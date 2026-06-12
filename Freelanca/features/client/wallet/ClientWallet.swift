//
//  ClientWallet.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ClientWalletView: View {
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
                        Image(systemName:"person.fill") // Replace with actual asset
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 12) {
                            
                            // Available Balance Card (Dark Theme)
                            VStack(alignment: .leading, spacing: 24) {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("AVAILABLE BALANCE")
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundColor(Color(hex: "#D1FF3F").opacity(0.8))
                                    
                                    Text("$450.00")
                                        .font(.system(size: 44, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                
                                HStack(spacing: 20) {
                                    Button(action: {}) {
                                        Text("Pay")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 16)
                                            .background(Color(hex: "#D1FF3F"))
                                            .cornerRadius(12)
                                    }
                                    
                                    Button(action: {}) {
                                        Text("Add Funds")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(Color(hex: "#D1FF3F"))
                                            .frame(maxWidth: .infinity)
                                            .padding(.vertical, 16)
                                            .background(Color.white.opacity(0.05))
                                            .cornerRadius(12)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color(hex: "#D1FF3F"), lineWidth: 1)
                                            )
                                    }
                                }
                            }
                            .padding(32)
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: "#1A1C1E"), Color(hex: "#0A1B2F")],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(24)
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            
                            // Metrics Grid
                            HStack(spacing: 16) {
                                RBACMetricCard(
                                    title: "In Escrow",
                                    amount: "$4,200.50",
                                    trend: "+12% vs last month",
                                    icon: "lock.fill"
                                )
                                
                                RBACMetricCard(
                                    title: "Pending Payouts",
                                    amount: "$840.00",
                                    progress: 0.8,
                                    icon: "clock.fill"
                                )
                            }
                            .padding(.horizontal, 24)
                            
                            // Transaction History Section
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Text("Transaction History")
                                        .font(.custom("LibreCaslonText-Bold", size: 24))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    Spacer()
                                    HStack(spacing: 4) {
                                        Text("View All")
                                        Image(systemName: "chevron.right")
                                    }
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                }
                                
                                // Filters
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 12) {
                                        FilterPill(title: "All History", isActive: false)
                                        FilterPill(title: "Paid", isActive: true)
                                        FilterPill(title: "In progress", isActive: false)
                                    }
                                }
                                
                                // Transaction Rows
                                VStack(spacing: 12) {
                                    RBACTransactionRow(
                                        title: "Payment to TechStream Inc.",
                                        subtitle: "Project: UI/UX Audit • Aug 24",
                                        amount: "+$2,400.00",
                                        status: "Completed",
                                        icon: "checkmark",
                                        iconBg: Color(hex: "#D1FF3F")
                                    )
                                    
                                    RBACTransactionRow(
                                        title: "Top up",
                                        subtitle: "Transfer • Aug 22",
                                        amount: "+$1,500.00",
                                        status: "Processing",
                                        icon: "creditcard.fill",
                                        iconBg: Color(hex: "#EFF4FF")
                                    )
                                    
                                    RBACTransactionRow(
                                        title: "Escrow Release: FinFlow",
                                        subtitle: "Milestone 2 • Aug 18",
                                        amount: "+$850.00",
                                        status: "Completed",
                                        icon: "checkmark",
                                        iconBg: Color(hex: "#D1FF3F")
                                    )
                                }
                            }
                            .padding(.horizontal, 24)
                            
                            // Financial Insights
                            VStack(alignment: .leading, spacing: 16) {
                                HStack(spacing: 20) {
                                    VStack(alignment: .leading, spacing: 12) {
                                        Text("Financial Insights")
                                            .font(.custom("LibreCaslonText-Bold", size: 20))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                        Text("Your settlements are 15% higher than last quarter. Keep it up!")
                                            .font(.system(size: 14))
                                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                            .lineSpacing(4)
                                        
                                        Text("GROWTH TREND")
                                            .font(.system(size: 11, weight: .bold))
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 6)
                                            .background(Color(hex: "#D1FF3F"))
                                            .cornerRadius(6)
                                            .padding(.top, 4)
                                    }
                                    
                                    Spacer()
                                    
                                    Image("chart_insight") // Replace with actual asset
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 80)
                                        .background(Color(hex: "#0A1B2F"))
                                        .cornerRadius(12)
                                        .overlay(
                                            Image(systemName: "chart.line.uptrend.xyaxis")
                                                .foregroundColor(Color(hex: "#D1FF3F"))
                                                .font(.system(size: 24))
                                        )
                                }
                            }
                            .padding(24)
                            .background(Color(hex: "#EFF4FF"))
                            .cornerRadius(24)
                            .padding(.horizontal, 24)
                            .padding(.bottom, 120)
                        }
                    }
                }
                
                
                
            }
        }
    }
}

// MARK: - Subviews

struct RBACMetricCard: View {
    let title: String
    let amount: String
    var trend: String? = nil
    var progress: Double? = nil
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                Text(title)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
            }
            
            Text(amount)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(hex: "#0A1B2F"))
            
            if let trendText = trend {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 10, weight: .bold))
                    Text(trendText)
                        .font(.system(size: 10, weight: .bold))
                }
                .foregroundColor(Color(hex: "#D1FF3F"))
                .colorMultiply(Color(hex: "#0A1B2F").opacity(0.8))
            }
            
            if let progressValue = progress {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color(hex: "#EFF4FF"))
                            .frame(height: 4)
                        Capsule()
                            .fill(Color(hex: "#D1FF3F"))
                            .frame(width: geo.size.width * progressValue, height: 4)
                    }
                }
                .frame(height: 4)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: "#0A1B2F").opacity(0.05), lineWidth: 1)
        )
    }
}

struct FilterPill: View {
    let title: String
    var isActive: Bool = false
    
    var body: some View {
        Text(title)
            .font(.system(size: 14, weight: .bold))
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(isActive ? Color(hex: "#0A1B2F") : Color(hex: "#EFF4FF"))
            .foregroundColor(isActive ? Color(hex: "#D1FF3F") : Color(hex: "#0A1B2F").opacity(0.6))
            .cornerRadius(10)
    }
}

struct RBACTransactionRow: View {
    let title: String
    let subtitle: String
    let amount: String
    let status: String
    let icon: String
    let iconBg: Color
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(iconBg)
                    .frame(width: 44, height: 44)
                Image(systemName: icon)
                    .foregroundColor(Color(hex: "#0A1B2F"))
                    .font(.system(size: 18))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1B2F"))
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.5))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(amount)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(hex: "#0A1B2F"))
                Text(status)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(status == "Completed" ? Color(hex: "#0A1B2F") : Color(hex: "#EFF4FF"))
                    .foregroundColor(status == "Completed" ? Color(hex: "#D1FF3F") : Color(hex: "#0A1B2F").opacity(0.6))
                    .cornerRadius(4)
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(hex: "#0A1B2F").opacity(0.05), lineWidth: 1)
        )
    }
}








#Preview {
    ClientWalletView()
}
