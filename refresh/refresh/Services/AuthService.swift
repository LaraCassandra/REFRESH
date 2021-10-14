//
//  AuthService.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    // INSTANCE OF FIREBASE
    static var auth = Auth.auth()
    
    // FUNCTION TO HOLD SIGN UP USER
    static func signUp(username: String, email: String, password: String, onSuccess:
                        @escaping (_ user: String) -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        
        // CREATE NEW AUTH USER WITH EMAIL AND PASSWORD
        auth.createUser(withEmail: email, password: password) {
            (authData, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else {return}
            //ADD NEW USER TO THE DB USING THE UID OF THE AUTH
            FirestoreService.addNewUser(uid: userId, username: username, email: email)
            onSuccess(userId)
        }
        
    }
    
    static func signIn(email: String, password: String, onSuccess:
                        @escaping (_ user: String) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        
        // USER THE AUTH INSTANCE TO CHECK LOGIN CREDS
        auth.signIn(withEmail: email, password: password) {
            (authData, error) in
            if(error != nil) {
                onError(error!.localizedDescription)
                return
            }
            
            guard let userId = authData?.user.uid else {return}
            onSuccess(userId)
        }
        
    }
    
    // SIGNOUT FUNCTION
    static func signOut() {
        try? auth.signOut()
        UserDefaults.standard.removeObject(forKey: "userId")
    }
    
}
