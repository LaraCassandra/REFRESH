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
    static func getUserId(user: String, userId: String) -> DocumentReference {
        
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
            "date": Date().timeIntervalSinceNow,
        ]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
        
    }
    
    // GET ALL POSTS
    @Published var posts = [Post]()
    
    func fetchAllPosts(){
        
        FirestoreService.db.collection("posts").order(by: "date").getDocuments{
            (querySnapshot, error) in
            
            if let error = error {
                print(error)
                return
            }
            else {
                
                self.posts.sort(by: {$1.date > $0.date})
                
                self.posts = querySnapshot!.documents.map{ (queryDocument) -> Post in
                    
                    let document = queryDocument.data()
                    
                    let caption = document["caption"] as? String ?? ""
                    let ownerId = document["ownerId"] as? String ?? ""

                    
                    // ! DOES NOT WORK
                    // GET POST OWNER USERNAME
//                    var username = ""
//
//                    let docRef = FirestoreService.db.collection("users").document(ownerId)
//                    docRef.getDocument{ (doc, error ) in
//                        if let error = error {
//                            print(error)
//                            return
//                        }
//                        else {
//                            username = doc?.data()?["username"] as? String ?? ""
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
    
    
    // GET USER INFO
    static func getUserInfo(userId: String, onSuccess: @escaping(_ user:User) -> Void){
        
        let docRef = db.collection("users").document(userId)
        
        docRef.getDocument{ (document, error ) in
            
            if let error = error {
                print(error)
                return
            }
            else {
                
                let document = document?.data()
                
                let username = document?["username"] as? String ?? ""
                let email = document?["email"] as? String ?? ""
                
                onSuccess(User(userName: username, email: email, posts: []))
                
            }
        }
    }
    
    init(){
        getUserPosts()
    }
    
    
    // GET USER POSTS BASED ON OWNERID
    func getUserPosts(){
        
        FirestoreService.db.collection("posts").order(by: "date").addSnapshotListener{
            (snap, error) in
            
            guard let documents = snap else {return}
            
            documents.documentChanges.forEach{ (post) in
                
                let document = post.document.data()
                
                let caption = document["caption"] as? String ?? ""
                let ownerId = document["ownerId"] as? String ?? ""
                let imgageUrl = document["imageUrl"] as? String ?? ""
                let date = document["date"] as? Double ?? 0
                let likeCount = document["likeCount"] as? Int ?? 0
                
                FirestoreService.getUserInfo(userId: ownerId){ (user) in
                    self.posts.append(Post(postId: post.document.documentID, caption: caption, imageUrl: imgageUrl, ownerID: ownerId, likeCount: likeCount, date: date))
                }
                
            }
        }
    }
    
}
