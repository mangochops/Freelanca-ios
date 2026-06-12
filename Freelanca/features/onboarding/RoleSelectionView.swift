//
//  RoleSelectionView.swift
//  Freelanca
//
//  Created by mac on 6/9/26.
//

import SwiftUI

struct RoleSelectionView: View {
    @EnvironmentObject var session: UserSession
    var body: some View {
        VStack(spacing: 0) {
            //HeaderSection
            VStack(spacing: 12) {
                Text("Freelanca") .font(.custom("LibreCaslonText-Bold", size: 28))
                    .foregroundColor(Color(hex: "#0A1B2F")
                    )
                Text("Choose your primary account type to get started.")
                .font(.system(size: 16)) .multilineTextAlignment(.center) .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6)) .padding(.horizontal, 40) } .padding(.top, 60) .padding(.bottom, 48) // Role Selection Cards
            VStack(spacing: 20) {
                RoleCard( role: .freelancer, title: "Get Started as Freelancer", description: "Get paid securely for your expertise and manage multiple client milestones with ease.", icon: "briefcase.fill", isSelected: session.role == .freelancer ) { session.role = .freelancer }
                RoleCard( role: .client, title: "I am a Client", description: "Hire experts, fund escrow contracts, and grow your business with a vetted workforce.", icon: "person.2.fill", isSelected: session.role == .client ) { session.role = .client } } .padding(.horizontal, 24)
            Spacer()
            // Footer Action
            VStack(spacing: 24) {
                                // Navigation to Registration
                                NavigationLink(destination: SignupView()) {
                                    HStack {
                                        Text("CONTINUE")
                                            .font(.system(size: 16, weight: .bold))
                                        Image(systemName: "arrow.right")
                                    }
                                    .foregroundColor(Color(hex: "#0A1B2F"))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 18)
                                    .background(session.role != nil ? Color(hex: "#D1FF3F") : Color(hex: "#D1FF3F").opacity(0.3))
                                    .cornerRadius(16)
                                    .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
                                }
                                .disabled(session.role == nil)
                                .padding(.horizontal, 24)
                                
                                HStack {
                                    Text("Already have an account?")
                                        .foregroundColor(Color(hex: "#0A1B2F").opacity(0.6))
                                    
                                    NavigationLink("Log In", destination: LoginView())
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(Color(hex: "#0A1B2F"))
                                }
                            }
                            .padding(.bottom, 40)
                            .background(Color(hex: "#F9F9FF").ignoresSafeArea())
        }
    }
    
}


struct RoleCard: View {
    let role: UserRole
    let title: String
    let description: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 16) { HStack {
                ZStack {
                    Circle()
                        .fill(role == .freelancer ? Color(hex: "#0A1B2F") : Color(hex: "#D1FF3F")) .frame(width: 48, height: 48)
                    Image(systemName: icon) .foregroundColor(role == .freelancer ? .white : Color(hex: "#0A1B2F"))
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark.circle.fill") .foregroundColor(Color(hex: "#0A1B2F")) .font(.title3) }
            }
                VStack(alignment: .leading, spacing: 8) { Text(title) .font(.custom("LibreCaslonText-Bold", size: 20)) .foregroundColor(Color(hex: "#0A1B2F"))
                        Text(description) .font(.system(size: 14)) .foregroundColor(Color(hex: "#0A1B2F").opacity(0.7))
                        .lineSpacing(4) .multilineTextAlignment(.leading) } }
            .padding(24)
            .background(Color.white)
            .cornerRadius(24)
            .overlay( RoundedRectangle(cornerRadius: 24) .stroke(isSelected ? Color(hex: "#0A1B2F") : Color.clear, lineWidth: 2) )
            .shadow(color: Color.black.opacity(0.03), radius: 15, x: 0, y: 8) }
    } }

#Preview {
    RoleSelectionView()
}
