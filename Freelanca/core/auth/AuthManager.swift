//
//  AuthManager.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import Foundation
import Combine

class AuthManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    // In a real app, you would check for a token in Keychain here
    func login() {
        // Mock authentication logic
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
}
