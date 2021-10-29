//
//  ProfilePostView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/21.
//

import SwiftUI

// EXTENSION TO CONVERT URL TO UIIMAGE
extension String {
    
    func getImage() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try Data(contentsOf: url)
            
            return UIImage(data: data) ?? UIImage()
        }
        catch {
            return UIImage()
        }
    }
    
}

struct ProfilePostView: View {
    
    var post: Post
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            Image(uiImage: "\(post.imageUrl)".loadImage())
                .resizable()
                .scaledToFit()
            
            HStack {
                
                Image(systemName: "heart")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .trailing)
                    .foregroundColor(Color("Peach"))
                
                Text("\(post.likeCount)")
                    .foregroundColor(Color("Peach"))
                    .font(Font.custom("Lato-Bold", size: 18))
                    .frame(alignment: .trailing)
                
            }
            
            Text(post.caption)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .font(Font.custom("Lato", size: 19))
            
            Text("\(NSDate(timeIntervalSince1970: post.date))")
                .padding(.top, 4)
                .foregroundColor(Color.gray)
                .font(Font.custom("Lato-Thin", size: 12))
            
        }
        .padding()
        
        
            }
        
        }


struct ProfilePostView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePostView(post: Post(postId: "1", caption: "1", imageUrl: "https://google.com", ownerID: "1", likeCount: 1, date: 0))
            .previewLayout(.sizeThatFits)
    }
}
