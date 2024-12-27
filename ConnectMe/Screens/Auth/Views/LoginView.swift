//
//  LoginView.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 15/12/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    
                    //logo
                    logoView
                    
                    //tittle
                    titleView
                    
                    Spacer().frame(height: 12)
                    
                    //textfield
                    InputView(placeholder: "Email or Phone no", text: $email)
                    InputView(placeholder: "password", isSecureField: true, text: $password)
                    
                    
                    //forgot button
                    forgotButtonView
                    
                    //login button
                    loginButtonView
                    
                    Spacer()
                    
                    //bottom view
                    bottomView
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical, 8)
            .alert("Something Went wrong", isPresented: $authViewModel.isError) {}
        }
    }
    
    private var line: some View {
        VStack {
            Divider().frame(height: 1)
        }
    }
    
    private var logoView: some View {
        Image("ConnectMe-Icon")
            .resizable()
            .scaledToFit()
    }
    
    private var titleView: some View {
        Text("Let`s Connect With us!")
            .font(.title2)
            .fontWeight(.semibold)
        
    }
    
    private var forgotButtonView: some View {
        HStack {
            Spacer()
            
            NavigationLink {
                ForgotPasswordView()
                    .environmentObject(authViewModel)
            } label: {
                Text("Forgot Password?")
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
        }
    }
    
    private var loginButtonView: some View {
        Button {
            Task{
                await authViewModel.login(email: email, password: password)
            }
        } label: {
            Text("Login")
            
        }
        .buttonStyle(CapsuleButtonStyle())
    }
    
    private var lineOrView: some View {
        HStack {
            line
            Text("Or")
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.gray)
    }
    
    private var bottomView: some View {
        VStack(spacing: 16) {
            lineOrView
            appleButtonView
            googleButtonView
            footerview
        }
    }
    
    private var appleButtonView: some View {
        Button {
            
        } label: {
            Label("Sign up with Apple", systemImage: "apple.logo")
        }
        .buttonStyle(CapsuleButtonStyle(bgColour: .black))
    }
    
    private var googleButtonView: some View {
        Button {
            
        } label: {
            HStack{
                Image("Google-Icon")
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("Sign up with Google")
            }
        }
        .buttonStyle(CapsuleButtonStyle(
            bgColour: .clear,
            textColour: .black,
            hasBorder: true
        ))
    }
    
    private var footerview: some View {
        NavigationLink {
            RegistrationView()
                .environmentObject(authViewModel)
        } label: {
            HStack{
                Text("Don`t have an account?")
                    .foregroundStyle(.black)
                Text("Sign up")
                    .foregroundStyle(.teal)
            }
            .fontWeight(.medium)
        }
        
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
