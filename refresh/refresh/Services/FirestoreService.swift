//
//  FirestoreService.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirestoreService {
    
    // CREATE AN INSTANCE OF FIRESTORE
    static var db = Firestore.firestore()
    
    // GET USER INFORMATION BASED ON UID
    static func getUserId(userId: String) -> DocumentReference {
        return db.collection("users").document(userId)
    }
    
    // ADD NEW USER TO THE DB FROM THE SIGNUP FUNCTION
    static func addNewUser(uid: String, username: String, email: String) {
        db.collection("users").document(uid).setData([
            "username": username,
            "email": email,
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            }
            else {
                print("Document was successfully written!")
            }
        }
    }
}
