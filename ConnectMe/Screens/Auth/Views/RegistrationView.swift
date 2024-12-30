//
//  RegistrationView.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 15/12/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var fullName: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var router: Router
    var name: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text(name)
            Text("To Register Please Fill Below Details")
                .font(.headline)
                .fontWeight(.medium)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            
            InputView(
                placeholder: "Email or Phone number", text: $email
            )
            
            InputView(
                placeholder: "Full Name",
                text: $fullName
            )
            
            InputView(
                placeholder: "Password",
                isSecureField: true,
                text: $password
            )
            
            VStack(alignment: .trailing) {
                InputView(
                    placeholder: "Confirm Password",
                    isSecureField: true,
                    text: $confirmPassword)
                
                Spacer()
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword ? Color(.systemGreen) : Color(.systemRed))
                }
            }
            
            Spacer()
            
            Button {
                
                Task{
                    await authViewModel.createUser(email: email, password: password, fullName: fullName)
                }
                
                if !authViewModel.isError {
                    presentationMode.wrappedValue.dismiss()
                }
                
            } label: {
                Text("Register")
            }
            .buttonStyle(CapsuleButtonStyle())
            
        }
        .navigationTitle("Registeration")
        .toolbarRole(.editor)
        .padding()
    }
    
    var isValidPassword: Bool {
        password.count >= 8 && password == confirmPassword
    }
    
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
