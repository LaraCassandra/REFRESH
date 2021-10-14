//
//  RegisterView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/07.
//

import SwiftUI

struct RegisterView: View {
    
    //APP STORAGE
    @AppStorage("userId") var userId: String = ""
    
    @State private var signUpUserval: String = ""
    @State private var signUpEmailVal: String = ""
    @State private var signUpPasswordVal: String = ""
    @State private var signUpPassword2Val: String = ""
    
    // ERROR HANDLING
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oh No!"
    
    func errorCheck() -> String? {
        if signUpUserval.trimmingCharacters(in: .whitespaces).isEmpty || signUpEmailVal.trimmingCharacters(in: .whitespaces).isEmpty || signUpPasswordVal.trimmingCharacters(in: .whitespaces).isEmpty
            {
            return "Please fill in all required info"
        }
        return nil
    }
    
    func signUp(){
        if let error = errorCheck() {
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        
        AuthService.signUp(username: signUpUserval, email: signUpEmailVal, password: signUpPasswordVal, onSuccess: {(uid) in
            print(uid)
                            
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
                    
                    HStack {
                        Image(systemName: "person")
                            .padding(.leading, 10)
                        TextField("username", text: $signUpUserval)
                            .padding()
                            .font(Font.custom("Lato", size: 15))
                            .disableAutocorrection(true)
                    }
                    .padding(.leading, 50)
                    
                    Text("Email")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))

                    HStack {
                        Image(systemName: "envelope")
                            .padding(.leading, 10)
                        TextField("email", text: $signUpEmailVal)
                            .padding()
                            .font(Font.custom("Lato", size: 15))
                            .disableAutocorrection(true)
                    }
                    .padding(.leading, 50)
                    
                    Text("Password")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                        
                    
                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading, 10)
                        SecureField("password", text: $signUpPasswordVal)
                            .padding()
                            .font(Font.custom("Lato", size: 15))
                            .disableAutocorrection(true)
                    }
                    .padding(.leading, 50)
                    
                    Text("Confirm Password")
                        .foregroundColor(.gray)
                        .font(Font.custom("Lato", size: 15))
                        .padding(.leading, 50)
                    
                    HStack {
                        Image(systemName: "lock")
                            .padding(.leading, 10)
                        SecureField("confirm password", text: $signUpPassword2Val)
                            .padding()
                            .font(Font.custom("Lato", size: 15))
                            .disableAutocorrection(true)
                    }
                    .padding(.leading, 50)
                    
                    Button(action: {
                        signUp()
                    }, label: {
                        Text("Sign Up")
                            .font(Font.custom("Lato-Bold", size: 20))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .center)
                    })
                    .foregroundColor(.white)
                    .background(Color("Peach"))
                    .cornerRadius(8)
                    .frame(width: 250.0, height: 50.0, alignment: .center)
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Try Again")))
                    })
                    
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
