
//
//  EmailSentView.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 27/12/24.
//

import SwiftUI

struct EmailSentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            
            Image(systemName: "envelope.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.teal)
            
            
            VStack(spacing: 8) {
                Text("Check your email")
                    .font(.largeTitle.bold())
                
                Text("We have sent a password recover instrurctions to your email.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            Button {
                router.navigateToRoot()
            } label: {
                Text("Skip, I`ll confirm later")
            }
            .buttonStyle(CapsuleButtonStyle())
            
            Spacer()
            
            Button {
                router.navigateBack()
            } label: {
                (Text("Did not receive the email? Check your spam folder, or ")
                    .foregroundStyle(.gray)
                 +
                 Text("try another email address")
                    .foregroundStyle(.teal))
            }
        }
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    EmailSentView()
}
