//
//  AuthViewModel.swift
//  ConnectMe
//
//  Created by Yogesh Rathore on 16/12/24.
//

import FirebaseAuth
import FirebaseFirestore

@MainActor
final class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var isError: Bool = false
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    
    init() {
        Task {
            await loadCurrentUser()
        }
    }
    
    func loadCurrentUser() async {
        if let user = auth.currentUser {
            userSession = user
            await fetchUser(by: user.uid)
        }
    }
    
    func login(email: String, password: String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            await fetchUser(by: authResult.user.uid)
            print("Current User = \(currentUser)")
        } catch {
            isError = true
        }
    }
    
    func fetchUser(by uid: String) async {
        do {
            let document = try await firestore.collection( "users").document(uid).getDocument()
            currentUser = try document.data(as: User.self)
        } catch {
            isError = true
        }
    }
    
    
    func createUser(email: String, password: String, fullName: String) async {
        do {
            let authResult = try await auth.createUser(withEmail: email, password: password)
            await storeUserInFireStore(uid: authResult.user.uid, email: email, fullName: fullName)
        } catch {
            isError = true
        }
        
    }
    
    func storeUserInFireStore(uid: String, email: String, fullName: String) async {
        let user = User(uid: uid, email: email, fullName: fullName)
        do{
            try firestore.collection("users").document(uid).setData(from: user)
        } catch {
            isError = true
        }
    }
    
    func signOut() async {
        do {
            currentUser = nil
            userSession = nil
            try auth.signOut()
        } catch{
            isError = true
        }
    }
}
