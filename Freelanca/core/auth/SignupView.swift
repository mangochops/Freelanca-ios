//
//  SignupView.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

struct SignupView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var agreeToTerms = false
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color(hex: "#F9F9FF").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header Navigation
                    HStack {
                        Button(action: {
                            // Back action
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color(hex: "#0A1B2F"))
                        }
                        
                        Text("Freelanca")
                            .font(.custom("LibreCaslonText-Bold", size: 24))
                            .foregroundColor(Color(hex: "#0A1B2F"))
                            .frame(maxWidth: .infinity)
                        
                        // Spacer for centering
                        Image(systemName: "arrow.left").opacity(0)
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 32) {
                            // Page Title
                            VStack(spacing: 12) {
                                Text("Create Account")
                                    .font(.custom("LibreCaslonText-Bold", size: 36))
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                
                                Text("Join the modern workforce ecosystem")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                            }
                            .padding(.top, 40)
                            
                            // Social Logins
                            VStack(spacing: 16) {
                                socialButton(title: "CONTINUE WITH GOOGLE", icon: "g.circle.fill", isDark: false)
                                socialButton(title: "CONTINUE WITH APPLE", icon: "apple.logo", isDark: true)
                            }
                            
                            // Divider
                            HStack {
                                VStack { Divider().background(Color(hex: "#0A1B2F").opacity(0.1)) }
                                Text("OR CONTINUE WITH EMAIL")
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                                    .padding(.horizontal, 8)
                                VStack { Divider().background(Color(hex: "#0A1B2F").opacity(0.1)) }
                            }
                            
                            // Form Fields
                            VStack(spacing: 24) {
                                CustomTextField(label: "FULL NAME", placeholder: "John Doe", text: $fullName)
                                CustomTextField(label: "EMAIL ADDRESS", placeholder: "name@company.com", text: $email)
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("PASSWORD")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                    
                                    HStack {
                                        if isPasswordVisible {
                                            TextField("••••••••", text: $password)
                                        } else {
                                            SecureField("••••••••", text: $password)
                                        }
                                        
                                        Button(action: { isPasswordVisible.toggle() }) {
                                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 18)
                                    .background(Color(hex: "#FFFFFF"))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(hex: "#0A1B2F").opacity(0.1), lineWidth: 1)
                                    )
                                }
                            }
                            
                            // Terms and Conditions
                            HStack(alignment: .top, spacing: 12) {
                                Button(action: { agreeToTerms.toggle() }) {
                                    Image(systemName: agreeToTerms ? "checkmark.square.fill" : "square")
                                        .font(.system(size: 24))
                                        .foregroundColor(agreeToTerms ? Color(hex: "#0A1B2F") : Color(hex: "#0A1B2F").opacity(0.2))
                                }
                                
                                Text("I agree to the ")
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.8)) +
                                Text("Terms of Service")
                                    .bold()
                                    .underline() +
                                Text(" and ")
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.8)) +
                                Text("Privacy Policy")
                                    .bold()
                                    .underline()
                            }
                            .font(.system(size: 14))
                            .multilineTextAlignment(.leading)
                            
                            // Primary Action
                            Button(action: {
                                // Signup logic
                            }) {
                                HStack {
                                    Text("CREATE ACCOUNT")
                                        .font(.system(size: 16, weight: .bold))
                                    Image(systemName: "arrow.right")
                                }
                                .foregroundColor(Color(hex: "#0A1B2F"))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 18)
                                .background(agreeToTerms ? Color(hex: "#D1FF3F") : Color(hex: "#D1FF3F").opacity(0.5))
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                            }
                            .disabled(!agreeToTerms)
                            
                            // Login Link
                            HStack {
                                Text("Already have an account?")
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                Button("Log In") {
                                    // Navigate to Login
                                }
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(hex: "#0A1B2F"))
                                .underline()
                            }
                            .padding(.bottom, 40)
                            
                            // Footer
                            VStack(spacing: 8) {
                                HStack(spacing: 6) {
                                    Image(systemName: "lock.fill")
                                        .font(.system(size: 12))
                                    Text("SECURED BY FREELANCA ESCROW PROTOCOL")
                                }
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                                
                                Text("© 2026 Mangochops Inc.")
                                    .font(.system(size: 10))
                                    .foregroundColor(Color(hex: "#0A1B2F").opacity(0.3))
                            }
                            .padding(.bottom, 24)
                        }
                        .padding(.horizontal, 24)
                    }
                }
            }
        }
    }
}

struct CustomTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(Color(hex: "#0A1B2F"))
            
            TextField(placeholder, text: $text)
                .padding(.horizontal, 16)
                .padding(.vertical, 18)
                .background(Color(hex: "#FFFFFF"))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(hex: "#0A1B2F").opacity(0.1), lineWidth: 1)
                )
        }
    }
}

#Preview {
    SignupView()
}

