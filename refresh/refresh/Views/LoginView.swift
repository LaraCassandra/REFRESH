//
//  LoginView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                
                Text("WELCOME BACK")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                Text("Please login to your account")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("Lato", size: 15))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("Email")
                    .foregroundColor(.gray)
                    .font(Font.custom("Lato", size: 15))
                
                Text("Password")
                    .foregroundColor(.gray)
                    .font(Font.custom("Lato", size: 15))
                
                Spacer()
                
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                    .font(Font.custom("Lato", size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                NavigationLink (
                    destination: RegisterView(),
                    label: {
                            Text("Register here")
                                .foregroundColor(.black)
                                .font(Font.custom("Lato-Bold", size: 15))
                        })
                
                Spacer()
                
            }
            
        }
        .navigationBarHidden(true)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
