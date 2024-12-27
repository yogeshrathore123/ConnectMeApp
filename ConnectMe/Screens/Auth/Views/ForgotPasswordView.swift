//
//  ForgotPasswordView.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 27/12/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email: String = ""
    @State private var isEmailSent: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading,spacing: 8) {
                Text("Reset Password")
                    .font(.largeTitle)
                
                Text("Enter the email associated with your account and we'll send you an email with instructions to reset your password.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 32)
            
            
            
            InputView(placeholder: "Enter your email",text: $email)
                .padding(.bottom, 16)
            
            
            
            Button {
                Task {
                    await authViewModel.resetPassword(by: email)
                    if !authViewModel.isError {
                        isEmailSent = true
                    }
                }
            } label: {
                Text("Send Instructions")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            Spacer()

        }
        .padding()
        .toolbarRole(.editor)
        .navigationDestination(isPresented: $isEmailSent) {
            EmailSentView()
        }
        .onAppear() {
            email = ""
        }
    }
}

#Preview {
    ForgotPasswordView()
}
