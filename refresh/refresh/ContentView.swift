//
//  ContentView.swift
//  refresh
//
//  Created by Lara Cook on 2021/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height: 250.0, alignment: .center)
                
                Spacer()
                
                NavigationLink (
                    destination: LoginView(),
                    label: {
                            Text("Login")
                                .foregroundColor(.white)
                                .font(Font.custom("Lato-Bold", size: 20))
                                .frame(width: 250.0, height: 50.0, alignment: .center)
                                .background(Color("Peach"))
                                .cornerRadius(8)
                        })
                    .padding()
                    
                NavigationLink (
                    destination: RegisterView(),
                    label: {
                            Text("Register")
                                .foregroundColor(Color("Peach"))
                                .font(Font.custom("Lato-Bold", size: 20))
                                .frame(width: 250.0, height: 50.0, alignment: .center)
                                .background(Color.white)
                                .border(Color("Peach"), width: 4)
                                .cornerRadius(8)
                        })
                
                Spacer()
                
                Text("Made by Lara Cook")
                    .font(Font.custom("Lato", size: 15))
                    .foregroundColor(.gray)
            
                Text("Version 1.0")
                    .font(Font.custom("Lato", size: 15))
                    .foregroundColor(.gray)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
