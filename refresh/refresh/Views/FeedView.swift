//
//  FeedView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FirestoreService()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{

                if viewModel.posts.count < 1 {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("Blue")))
                }
                else {
                    ForEach(viewModel.posts) { post in
                        PostCardView(post: post)
                    }
                
                }
                
            }
            .navigationBarItems(leading: Text("YOUR FEED"))
        }
        .onAppear(perform: {
            viewModel.fetchAllPosts()
        })
        .accentColor(Color("Blue"))
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
