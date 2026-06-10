//
//  FreelancaApp.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

@main
struct FreelancaApp: App {
    @StateObject var authState = AuthManager()
    var body: some Scene {
            WindowGroup {
                Group {
                    if authState.isLoggedIn {
                        ContentView() // Your main authenticated UI
                    } else {
                        OnboardingView() // Your onboarding flow
                    }
                }
                .environmentObject(authState) // Injects the manager into the environment
            }
        }
}
