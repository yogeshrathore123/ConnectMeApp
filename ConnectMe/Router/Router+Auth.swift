//
//  Router+Auth.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 30/12/24.
//

import SwiftUI

extension Router {
    
    @ViewBuilder
    func destination(for flow: AuthFlow) -> some View {
        switch flow {
        case .login: LoginView()
        case .forgotPassword: ForgotPasswordView()
        case .registrationAccount(let item): RegistrationView(name: item.name)
        case .emailSent: EmailSentView()
        case .profile: ProfileView()
        }
    }
}
