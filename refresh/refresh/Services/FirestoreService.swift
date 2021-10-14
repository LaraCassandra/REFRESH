//
//  FirestoreService.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class FirestoreService: ObservableObject {
    
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
    
    // ADD POST TO DATABASE
    static func addNewPost(caption: String, imageUrl: String){
        
        db.collection("posts").document().setData([
            "caption": caption,
            "imageUrl": imageUrl,
            "ownerId": Auth.auth().currentUser!.uid,
            "likeCount": 0,
            "date": Date().timeIntervalSince1970
        ]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
        
    }
    
    @Published var posts = [Post]()
    
    func fetchAllPosts(){
        
        FirestoreService.db.collection("posts").getDocuments{
            (querySnapshot, error) in
            
            if let error = error {
                print(error)
                return
            }
            else {
                
                self.posts = querySnapshot!.documents.map{ (queryDocument) -> Post in
                    
                    let document = queryDocument.data()
                    
                    let caption = document["caption"] as? String ?? ""
                    let ownerId = document["ownerId"] as? String ?? ""
                
//                    var username = ""
//
//                    FirestoreService.db.collection("users").document(ownerId).getDocument{
//                        (document, error) in
//                        username = document![username] as? String ?? ""
//
//                        if let error = error {
//                            print(error)
//                            username = document!["username"] as? String ?? ""
//                        }
//                    }
                    
                    let imageUrl = document["imageUrl"] as? String ?? ""
                    let date = document["date"] as? Double ?? 00
                    let likeCount = document["likeCount"] as? Int ?? 0
                    
                    return Post(postId: queryDocument.documentID, caption: caption, imageUrl: imageUrl, ownerID: ownerId, likeCount: likeCount, date: date)
                    
                }
                
            }
        }
        
    }
    
}
