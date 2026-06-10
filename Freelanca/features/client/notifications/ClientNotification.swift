//
//  ClientNotification.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

struct ClientNotificationsView: View {
    @State private var selectedFilter = "All"
    let filters = ["All", "Payments", "Projects", "Security"]
    
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
                        Image("user_avatar") // Placeholder for user profile photo
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(color: Color.black.opacity(0.1), radius: 5)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(Color.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 32) {
                            
                            // Page Header
                            HStack(alignment: .lastTextBaseline) {
                                Text("Notifications")
                                    .font(.custom("LibreCaslonText-Bold", size: 32))
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                Spacer()
                                Button("Mark all as read") { }
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                            
                            // Filters
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(filters, id: \.self) { filter in
                                        Button(action: { selectedFilter = filter }) {
                                            Text(filter)
                                                .font(.system(size: 14, weight: .bold))
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 12)
                                                .background(selectedFilter == filter ? Color(hex: "#D1FF3F") : Color(hex: "#EFF4FF"))
                                                .foregroundColor(Color(hex: "#0A1B2F"))
                                                .cornerRadius(12)
                                        }
                                    }
                                }
                                .padding(.horizontal, 24)
                            }
                            
                            // Notification Groups
                            VStack(alignment: .leading, spacing: 24) {
                                NotificationSection(title: "TODAY") {
                                    NotificationCard(
                                        icon: "creditcard.fill",
                                        title: "Payment Received",
                                        message: "Successfully received $2,450.00 for 'Fintech Dashboard UI' milestone. Funds are now available in your wallet.",
                                        time: "2h ago",
                                        isNew: true,
                                        actionTitle: "View Wallet"
                                    )
                                    
                                    NotificationCard(
                                        icon: "checkmark.circle.fill",
                                        title: "Milestone Approved",
                                        message: "Acme Corp has approved Milestone 2: 'High-Fidelity Prototypes'. Your payment is being processed.",
                                        time: "5h ago",
                                        isNew: true
                                    )
                                }
                                
                                NotificationSection(title: "YESTERDAY") {
                                    NotificationCard(
                                        icon: "briefcase.fill",
                                        title: "New Project Invitation",
                                        message: "Global Dynamics invited you to bid on 'Supply Chain Optimization Platform'. Budget: $15k - $25k.",
                                        time: "1d ago",
                                        actionTitle: "View Details"
                                    )
                                    
                                    NotificationCard(
                                        icon: "shield.lefthalf.filled",
                                        title: "Security Alert",
                                        message: "A new login was detected from a Chrome browser on a Linux device in Berlin, Germany. Was this you?",
                                        time: "1d ago",
                                        actionTitle: "Secure Account",
                                        isDestructive: true
                                    )
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.bottom, 100)
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
    ClientNotificationsView()
}
