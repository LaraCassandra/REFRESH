//
//  PostCardView.swift
//  refresh
//
//  Created by Lara Cook on 2021/10/14.
//

import SwiftUI

// EXTENSION TO CONVERT URL TO UIIMAGE
extension String {
    
    func loadImage() -> UIImage {
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

struct PostCardView: View {
    
    var post: Post
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
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
            
            Image(uiImage: "\(post.imageUrl)".loadImage())
                .resizable()
                .scaledToFit()
            
            HStack {
                
                Text(post.ownerID)
                    .foregroundColor(Color("Blue"))
                    .font(Font.custom("ebrima", size: 20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 10)
                    .padding(.bottom, 5)
                
                
                Image(systemName: "arrowtriangle.right.fill")
                    .foregroundColor(Color("Blue"))
                
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

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        PostCardView(post: Post(postId: "1", caption: "Caption", imageUrl: "https://media.4-paws.org/1/e/d/6/1ed6da75afe37d82757142dc7c6633a532f53a7d/VIER%20PFOTEN_2019-03-15_001-2886x1999-1920x1330.jpg", ownerID: "1", likeCount: 2, date: 0))
            .previewLayout(.sizeThatFits)
    }
}
