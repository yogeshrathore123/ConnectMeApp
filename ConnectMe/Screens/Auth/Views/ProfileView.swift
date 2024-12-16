//
//  ProfileView.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 16/12/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            Spacer()
            
            if let currentUser = authViewModel.currentUser {
                Text("Hello \(currentUser.fullName)")
            } else{
                ProgressView("Please wait...")
            }
            Spacer()
            
            Button("Sign Out") {
                Task{
                    await authViewModel.signOut()
                }
            }

            
            
        }
    }
}

#Preview {
    ProfileView()
}
