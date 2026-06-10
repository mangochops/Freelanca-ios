//
//  TabModel.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import SwiftUI

enum AppTab: String, CaseIterable {
    case home = "Home"
    case projects = "Projects"
    case wallet = "Wallet"
    case notifications = "Notifications"
    case profile = "Profile"

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .projects: return "briefcase"
        case .wallet: return "creditcard"
        case .notifications: return "bell"
        case .profile: return "person"
        }
    }
}
