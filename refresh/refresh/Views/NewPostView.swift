//
//  NewPostView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI

struct NewPostView: View {
    
    // STATE VARIABLES FOR POSTS
    @State var caption: String = "Your caption here..."
    @State var pickedImage: UIImage?
    @State var displayImage: Image?
    
    // ERROR HANDLING
    @State var errorMessage = ""
    @State var showingAlert = false
    @State var errorTitle = "Oh No!"
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("CREATE A NEW POST")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .padding(.bottom, 1)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color("Peach"))
                    .padding(20)
                
                TextEditor(text: $caption)
                    .padding(20)
                    .frame(height: 200)
                    .background(RoundedRectangle(cornerRadius: 10.0).stroke(Color("Peach")))
                
                Button(action: {
                    print("Clicked post button")
                }, label: {
                    Text("POST!")
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
                
            }.padding()
            
        }
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
