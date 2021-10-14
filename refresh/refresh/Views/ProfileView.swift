//
//  ProfileView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text("USERNAME")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .padding(.bottom, 1)
                    .padding(.leading, 50)
                    .frame(alignment: .leading)
                
                Text("EMAIL")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .padding(.bottom, 1)
                    .padding(.leading, 50)
                    .frame(alignment: .leading)
                
                Text("YOUR POSTS")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .padding(.bottom, 1)
                    .padding(.leading, 50)
                    .frame(alignment: .leading)
                
                ScrollView{
                    
                    
                    
                }
                
            }
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
