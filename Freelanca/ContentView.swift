//
//  ContentView.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var session = UserSession()
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        ZStack {
            Color(hex: "#F9F9FF").ignoresSafeArea()
            
            VStack {
                // Select view hierarchy based on role
                switch session.role {
                case .freelancer:
                    FreelancerContentView(selectedTab: $selectedTab)
                case .client:
                    ClientContentView(selectedTab: $selectedTab)
                case nil:
                    // Handle the case where the user hasn't selected a role yet
                    RoleSelectionView()
                }
                
                
            }
        }
        .environmentObject(session)
    }
}

struct FreelancerContentView: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home: FreelancerDashboardView()
            case .projects: FreelancerProjectsView()
            case .wallet: FreelancerWalletView()
            case .notifications: FreelancerNotificationView()
            case .profile: FreelancerProfileView()
            }
            Spacer()
            Navbar(selectedTab: $selectedTab)
        }
    }
}

struct ClientContentView: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        VStack {
            switch selectedTab {
            case .home: ClientDashboard()
            case .projects: ClientProjectsView()
            case .wallet: ClientWalletView()
            case .notifications: ClientNotificationsView()
            case .profile: ClientProfileView()
            }
            Spacer()
            Navbar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
