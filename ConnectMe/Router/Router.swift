//
//  Router.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 28/12/24.
//

import SwiftUI

final class Router: ObservableObject {
    
    @Published var navPath = NavigationPath()
    
    enum AuthFlow: Codable, Hashable {
        case login
        case registrationAccount
        case profile
        case forgotPassword
        case emailSent
    }
    
    func navigateTo(to destination: AuthFlow) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
