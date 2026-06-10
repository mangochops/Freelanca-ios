//
//  RoleModel.swift
//  Freelanca
//
//  Created by mac on 6/10/26.
//

import Foundation

enum UserRole {
    case freelancer
    case client
}

class UserSession: ObservableObject {
    @Published var role: UserRole? = nil // Default or fetched from auth
}
