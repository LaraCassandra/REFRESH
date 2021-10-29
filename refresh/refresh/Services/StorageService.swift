//
//  StorageService.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI
import Firebase
import FirebaseStorage

class StorageService {
    
    // CREATE AN INSTANCE OF FIREBASE STORAGE
    static var storage = Storage.storage()
    
    // CREATE AN INSTANCE OF STORAGE URL
    static var storageRoot = storage.reference()
    
    // INSTANCE OF THE FOLDER IN STORAGE
    static var storagePost = storageRoot.child("posts")
    
  
    // FUNCTION TO PERFORM UPLOAD
    static func savePost (caption: String, image: UIImage, onSuccess: @escaping()->Void, onError: @escaping(_ errorMessage: String)->Void){
        
        // NAME OF THE IMAGE
        let fileName = storagePost.child(Date().description)
        
        // UPLOAD IMAGE
        if let imageData = image.jpegData(compressionQuality: 1){
            
            fileName.putData(imageData, metadata: nil){
                (_, error) in
                
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    onError(error.localizedDescription)
                    return
                }
                
                // GET DOWNLOADABLE LINK
                fileName.downloadURL{ (url, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        onError(error.localizedDescription)
                        return
                    }
                    
                    if let metaDataUrl = url?.absoluteString {
                        FirestoreService.addNewPost(caption: caption, imageUrl: metaDataUrl)
                        onSuccess()
                        return
                        
                    }
                }
            }
        }
        else {
            onError("Could not decode the image")
            return
        }
        
    }
    
}
