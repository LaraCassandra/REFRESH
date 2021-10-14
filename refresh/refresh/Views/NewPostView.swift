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
    
    // IMAGE HANDLING
    @State var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
        
    func loadImage() {
        guard let inputImage = pickedImage else { return }
        pickedImage = inputImage
        displayImage = Image(uiImage: inputImage)
    }
    
    // SHEET HANDLING
    @State var showingActionSheet = false
    
    // FUNCTIONALITY HANDLING
    func errorCheck() -> String? {
        if caption.trimmingCharacters(in: .whitespaces).isEmpty || pickedImage == nil
            {
            return "Please upload an image with a caption"
        }
        return nil
    }
    
    func clear() {
        self.displayImage = nil
        self.caption = ""
    }
    
    func uploadImage() {
        if let error = errorCheck() {
            self.errorMessage = error
            self.showingAlert = true
            return
        }
        self.clear()
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("CREATE A NEW POST")
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima-bold", size: 20))
                    .padding(.bottom, 1)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                
                if displayImage != nil {
                    displayImage!.resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 150, alignment: .center)
                        .onTapGesture(perform: {
                            self.showingImagePicker = true
                        })
                }
                else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding(10)
                        .foregroundColor(Color("Peach"))
                        .onTapGesture(perform: {
                            self.showingImagePicker = true
                        })
                }
                
                TextEditor(text: $caption)
                    .padding(20)
                    .frame(height: 200)
                    .background(RoundedRectangle(cornerRadius: 10.0).stroke(Color("Peach")))
                
                Button(action: {
                    uploadImage()
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
                
            }
            .padding()
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage){
                ImagePicker(pickedImage: $pickedImage)
            }.actionSheet(isPresented: $showingActionSheet){
                ActionSheet(title: Text(""), buttons: [
                    .default(Text("Upload an Image")){
                        self.showingImagePicker = true
                        self.sourceType = .photoLibrary
                    },
                    .default(Text("Take a Picture")){
                        self.showingImagePicker = true
                        self.sourceType = .camera
                    },
                    .cancel()
                ])
            }
            
        }
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
