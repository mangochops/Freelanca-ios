//
//  LoginView.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var keepLoggedIn = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#F9F9FF").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    // Logo Section
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color(hex: "#D1FF3F"))
                            .frame(width: 100, height: 100)
                        
                        Text("freelanca")
                            .font(.custom("LibreCaslonText-Bold", size: 16))
                            .foregroundColor(Color(hex: "#0A1B2F"))
                    }
                    .padding(.bottom, 32)
                    
                    // Heading
                    VStack(spacing: 12) {
                        Text("Welcome back")
                            .font(.custom("LibreCaslonText-Bold", size: 36))
                            .foregroundColor(Color(hex: "#0A1B2F"))
                        
                        Text("Securely access your freelance workspace")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                    }
                    .padding(.bottom, 40)
                    
                    // Login Card
                    VStack(spacing: 24) {
                        VStack(alignment: .leading, spacing: 20) {
                            // Email Field
                            VStack(alignment: .leading, spacing: 8) {
                                Text("EMAIL ADDRESS")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                
                                HStack {
                                    Image(systemName: "envelope")
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                                    TextField("name@company.com", text: $email)
                                }
                                .padding()
                                .background(Color(hex: "#EFF4FF"))
                                .cornerRadius(12)
                            }
                            
                            // Password Field
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("PASSWORD")
                                        .font(.system(size: 12, weight: .bold))
                                    Spacer()
                                    Button("Forgot?") { }
                                        .font(.system(size: 12, weight: .bold))
                                }
                                .foregroundColor(Color(hex: "#0A1B2F"))
                                
                                HStack {
                                    Image(systemName: "lock")
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                                    SecureField("••••••••", text: $password)
                                    Image(systemName: "eye")
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                                }
                                .padding()
                                .background(Color(hex: "#EFF4FF"))
                                .cornerRadius(12)
                            }
                        }
                        
                        // Keep me logged in
                        Toggle(isOn: $keepLoggedIn) {
                            Text("Keep me logged in")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(Color(hex: "#0A1B2F"))
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        
                        // Log In Button
                        Button(action: {
                            // Login action
                        }) {
                            HStack {
                                Text("LOG IN")
                                    .font(.system(size: 16, weight: .bold))
                                Image(systemName: "arrow.right")
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color(hex: "#0A1B2F"))
                            .cornerRadius(12)
                        }
                        
                        // Divider
                        HStack {
                            VStack { Divider() }
                            Text("OR")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.4))
                            VStack { Divider() }
                        }
                        .padding(.vertical, 8)
                        
                        // Social Buttons
                        HStack(spacing: 16) {
                            SocialButton(title: "GOOGLE", icon: "g.circle.fill")
                            SocialButton(title: "GITHUB", icon: "terminal.fill")
                        }
                    }
                    .padding(24)
                    .background(Color.white)
                    .cornerRadius(32)
                    .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: 10)
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    // Footer
                    VStack(spacing: 16) {
                        HStack {
                            Text("New to Freelanca?")
                                .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                            Button("Create your account") { }
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color(hex: "#0A1B2F"))
                                .underline()
                        }
                        
                        HStack(spacing: 8) {
                            Button("Privacy Policy") { }
                            Circle().fill(Color(hex: "#D1FF3F")).frame(width: 4, height: 4)
                            Button("Terms of Service") { }
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                    }
                    .padding(.bottom, 24)
                }
            }
        }
    }
}

struct SocialButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        Button(action: { }) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                Text(title)
                    .font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(Color(hex: "#0A1B2F"))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "#0A1B2F").opacity(0.1), lineWidth: 1)
            )
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? Color(hex: "#0A1B2F") : Color(hex: "#0A1B2F").opacity(0.2))
                configuration.label
            }
        }
    }
}





#Preview {
    LoginView()
}
