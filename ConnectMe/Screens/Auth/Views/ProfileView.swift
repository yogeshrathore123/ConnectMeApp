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
        
        if let user = authViewModel.currentUser {
            List {
                Section {
                    HStack(spacing: 16) {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 70, height: 70)
                            .background(Color(.lightGray))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(user.email)
                                .font(.footnote)
                        }
                    }
                }
                
                Section("Account") {
                    Button {
                        authViewModel.signOut()
                    } label: {
                        Label {
                            Text("Sign Out")
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(.red)
                        }
                    }
                    
                    Button {
                        Task{
                            await authViewModel.deleteAccount()
                        }
                    } label: {
                        Label {
                            Text("Delete Account")
                                .foregroundStyle(.black)
                        } icon: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(.red)
                        }

                    }


                }
            }
        } else {
            ProgressView("Please wait...")
        }
        
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
