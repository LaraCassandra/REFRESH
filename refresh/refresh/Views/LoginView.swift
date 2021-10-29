//
//  LoginView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import SwiftUI

struct LoginView: View {
    
    // APP STORAGE
    @AppStorage("userId") var userId: String = ""
    
    @State private var emailVal: String = ""
    @State private var passwordVal: String = ""
    
    // ERROR HANDLING
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oh No!"
    
    func errorCheck() -> String? {
        if emailVal.trimmingCharacters(in: .whitespaces).isEmpty || passwordVal.trimmingCharacters(in: .whitespaces).isEmpty
            {
            return "Please fill in all required info"
        }
        return nil
    }
    
    func login() {
        if let error = errorCheck() {
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        
        AuthService.signIn(email: emailVal, password: passwordVal, onSuccess: {(uid) in
            print(uid)
            userId = uid
            return
        }, onError: {(error) in
            self.errorMessage = error
            self.showingAlert = true
            return
        })
        
    }
    
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
                
                VStack {
                    
                    Text("Email")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                        
                    
                    HStack {
                        Image(systemName: "envelope")
                            .padding(.leading, 10)
                        TextField("email", text: $emailVal)
                            .padding()
                            .font(Font.custom("Lato", size: 15))
                            .disableAutocorrection(true)
                            .background(RoundedRectangle(cornerRadius: 10.0).stroke(Color("Peach")))
                    }
                    .padding(.leading, 50)
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                    
                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading, 10)
                        SecureField("password", text: $passwordVal)
                            .padding()
                            .font(Font.custom("Lato", size: 15))
                            .disableAutocorrection(true)
                            .background(RoundedRectangle(cornerRadius: 10.0).stroke(Color("Peach")))
                    }
                    .padding(.leading, 50)
                    
                    Button(action: {
                        login()
                    }, label: {
                        Text("Sign Up")
                            .font(Font.custom("Lato-Bold", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                    .foregroundColor(.white)
                    .background(Color("Peach"))
                    .frame(width: 250.0, height: 50.0, alignment: .center)
                    .cornerRadius(8)
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try Again")))
                    })
                    
                }
                
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
