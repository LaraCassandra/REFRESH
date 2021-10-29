//
//  UserModel.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/28.
//

import SwiftUI
import FirebaseFirestore
import Firebase

struct User {
    var userName: String
    var email: String
    var posts: [Post]
}
