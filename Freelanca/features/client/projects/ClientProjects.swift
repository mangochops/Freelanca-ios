//
//  ClientProjects.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ClientProjectsView: View {
    @State private var selectedFilter = "Active Contracts (4)"
    let filters = ["Active Contracts (4)", "Pending (2)", "Completed"]
    
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
                        VStack(alignment: .leading, spacing: 28) {
                            
                            // Page Header & Primary Action
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Projects")
                                        .font(.custom("LibreCaslonText-Bold", size: 32))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    Text("Manage your active contracts and earnings")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                }
                                Spacer()
                                Button(action: {}) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "magnifyingglass")
                                            .font(.system(size: 16, weight: .bold))
                                        Text("Browse\nGigs")
                                            .font(.system(size: 12, weight: .bold))
                                            .multilineTextAlignment(.leading)
                                    }
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 12)
                                    .background(Color(hex: "#D1FF3F"))
                                    .cornerRadius(12)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            
                            // Filter Tabs
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(filters, id: \.self) { filter in
                                        Button(action: { selectedFilter = filter }) {
                                            Text(filter)
                                                .font(.system(size: 14, weight: .bold))
                                                .padding(.horizontal, 16)
                                                .padding(.vertical, 10)
                                                .background(selectedFilter == filter ? Color(hex: "#0A1B2F") : Color(hex: "#EFF4FF"))
                                                .foregroundColor(selectedFilter == filter ? .white : Color(hex: "#0A1B2F").opacity(0.6))
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                            
                            // Project Cards
                            VStack(spacing: 20) {
                                // Active Card: E-commerce Web App
                                RBACProjectCard(
                                    title: "E-commerce Web App",
                                    subtitle: "Global Logistics Corp.",
                                    icon: "network",
                                    status: "In Progress",
                                    statusBg: Color(hex: "#D1FF3F").opacity(0.4),
                                    amount: "$4,500.00",
                                    progress: 0.65,
                                    footerText: "Milestone 2 of 3",
                                    footerSubtext: "65% Complete",
                                    primaryAction: "View Work"
                                )
                                
                                // Pending Card: Brand Identity Design
                                RBACProjectCard(
                                    title: "Brand Identity Design",
                                    subtitle: "Nova Health Systems",
                                    icon: "pencil.and.outline",
                                    status: "Pending Approval",
                                    statusBg: Color(hex: "#B2EBE0"),
                                    amount: "$2,200.00",
                                    progress: 0.9,
                                    progressBarColor: Color(hex: "#3D5A54"),
                                    footerText: "Awaiting Client",
                                    footerSubtext: "Final Review",
                                    primaryAction: "Approve & Release",
                                    primaryActionIsDark: true
                                )
                                
                                // Help Section
                                VStack(spacing: 20) {
                                    ZStack {
                                        Circle()
                                            .fill(Color(hex: "#D1FF3F"))
                                            .frame(width: 80, height: 80)
                                        Image(systemName: "briefcase.fill")
                                            .font(.system(size: 32))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                        Image(systemName: "clock.fill")
                                            .font(.system(size: 16))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                            .offset(x: 22, y: 22)
                                    }
                                    
                                    VStack(spacing: 8) {
                                        Text("Need more help?")
                                            .font(.custom("LibreCaslonText-Bold", size: 24))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                        Text("Find the perfect freelancer for your next big idea.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                            .padding(.horizontal, 40)
                                    }
                                    
                                    Button(action: {}) {
                                        Text("Find More Freelancers")
                                            .font(.system(size: 16, weight: .bold))
                                            .foregroundColor(Color(hex: "#0A1B2F"))
                                    }
                                }
                                .padding(.vertical, 40)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 24)
                                        .stroke(Color(hex: "#0A1B2F").opacity(0.1), style: StrokeStyle(lineWidth: 1, dash: [6]))
                                )
                            }
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

struct RBACProjectCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let status: String
    let statusBg: Color
    let amount: String
    let progress: Double
    var progressBarColor: Color = Color(hex: "#D1FF3F")
    let footerText: String
    let footerSubtext: String
    let primaryAction: String
    var primaryActionIsDark: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "#D1FF3F").opacity(0.2))
                        .frame(width: 56, height: 56)
                    Image(systemName: icon)
                        .font(.system(size: 24))
                        .foregroundColor(Color(hex: "#0A1B2F"))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.custom("LibreCaslonText-Bold", size: 18))
                        .foregroundColor(Color(hex: "#0A1B2F"))
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                }
                
                Spacer()
                
                Text(status)
                    .font(.system(size: 10, weight: .bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(statusBg)
                    .cornerRadius(8)
            }
            
            VStack(spacing: 8) {
                HStack {
                    Text("Escrow Amount")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                    Spacer()
                    Text(amount)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color(hex: "#0A1B2F"))
                }
                
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color(hex: "#EFF4FF"))
                            .frame(height: 8)
                        Capsule()
                            .fill(progressBarColor)
                            .frame(width: geo.size.width * progress, height: 8)
                    }
                }
                .frame(height: 8)
                
                HStack {
                    Text(footerText)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                    Spacer()
                    Text(footerSubtext)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                }
            }
            
            HStack(spacing: 12) {
                Button(action: {}) {
                    Text(primaryAction)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(primaryActionIsDark ? .white : Color(hex: "#0A1B2F"))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(primaryActionIsDark ? Color(hex: "#0A1B2F") : Color(hex: "#EFF4FF"))
                        .cornerRadius(10)
                }
                
                Button(action: {}) {
                    Image(systemName: "chat.bubble.text")
                        .font(.system(size: 18))
                        .foregroundColor(Color(hex: "#0A1B2F"))
                        .frame(width: 54, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(hex: "#0A1B2F").opacity(0.1), lineWidth: 1)
                        )
                }
            }
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: Color.black.opacity(0.02), radius: 10, y: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color(hex: "#0A1B2F").opacity(0.05), lineWidth: 1)
        )
    }
}








#Preview {
    ClientProjectsView()
}
