//
//  PostModel.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import Foundation

struct Post: Identifiable {
    
    var id = UUID()
    var postId: String
    var caption: String
    var imageUrl: String
    var ownerID: String
    var likeCount: Int
    var date: Double
    
}
