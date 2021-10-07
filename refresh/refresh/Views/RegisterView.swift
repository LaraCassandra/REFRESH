//
//  RegisterView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
    
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100.0, height: 100.0, alignment: .center)
                
                Text("WELCOME TO REFRESH")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                Text("Enter your details to create an account")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("Lato", size: 15))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    
                    Text("Username")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                    
                    Text("Email")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                    
                    Text("Confirm Password")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                    
                }
                
                Spacer()
                
                Text("Already have an account?")
                    .foregroundColor(.gray)
                    .font(Font.custom("Lato", size: 15))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 1)
                
                NavigationLink (
                    destination: LoginView(),
                    label: {
                            Text("Login here")
                                .foregroundColor(.black)
                                .font(Font.custom("Lato-Bold", size: 15))
                        })
                
                Spacer()
                
            }
    
        }
        .navigationBarHidden(true)
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
