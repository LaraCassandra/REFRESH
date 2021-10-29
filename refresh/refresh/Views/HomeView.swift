//
//  HomeView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView {
            
            FeedView()
                .tabItem({
                    Image(systemName: "house")
                    
                })
            
            NewPostView()
                .tabItem({
                    Image(systemName: "plus")
                })
            
            ProfileView(user: User(userName: "", email: "", posts: []))
                .tabItem({
                    Image(systemName: "person")
                })
            
        }
        .accentColor(Color("Peach"))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
