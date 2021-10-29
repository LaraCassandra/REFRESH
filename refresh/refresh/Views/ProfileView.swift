//
//  ProfileView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = FirestoreService()
    @State var user: User
    @AppStorage("userId") var userId: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
            
            VStack(alignment: .leading){
                
                HStack {
                    
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color("Peach"))
                
                    Text("USERNAME")
                        .foregroundColor(Color("Peach"))
                        .font(Font.custom("ebrima-bold", size: 20))
                        
                    
                }
                .padding(.bottom, 1)
                .padding(.leading, 50)
                                
                Text(user.userName)
                    .foregroundColor(Color.black)
                    .font(Font.custom("Lato", size: 18))
                    .padding(.bottom, 5)
                    .padding(.leading, 50)
                
                HStack {
                    
                    Image(systemName: "envelope.circle.fill")
                        .foregroundColor(Color("Peach"))
                    
                    Text("EMAIL")
                        .foregroundColor(Color("Peach"))
                        .font(Font.custom("ebrima-bold", size: 20))
                    
                }
                .padding(.bottom, 1)
                .padding(.leading, 50)
                
                Text(user.email)
                    .foregroundColor(Color.black)
                    .font(Font.custom("Lato", size: 18))
                    .padding(.bottom, 5)
                    .padding(.leading, 50)
                
                Text("YOUR POSTS")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .padding(.top, 50)
                    .padding(.bottom, 1)
                    .padding(.leading, 40)
                
                
                    
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    if viewModel.posts.count < 1 {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("Blue")))
                    }
                    else {
                        
                        ForEach(viewModel.posts) { post in
                            ProfilePostView(post: post)
                        }
                    }
                        
                }
                .padding(20)
                .onAppear(perform: {
                    FirestoreService.getUserInfo(userId: userId, onSuccess: {user in
                        self.user = user
                    })
                })
                    
                    
                
                
            }.navigationBarItems(leading: Text("YOUR PROFILE"))
            .foregroundColor(Color("Blue"))
            
            }
                
        }
        .onAppear(perform: {
            viewModel.fetchAllPosts()
        })
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(userName: "Lara Cook", email: "Lara@gmail.com", posts: []))
    }
}
