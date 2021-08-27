//
//  GalleryView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        VStack{
            ContentGallery(content1: "ic_swift", content2: "ic_swift", content3: "ic_swift", content4: "ic_swift")
            ContentGallery(content1: "ic_swift", content2: "ic_swift", content3: "ic_swift", content4: "ic_swift")
            ContentGallery(content1: "ic_swift", content2: "ic_swift", content3: "ic_swift", content4: "ic_swift")
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

struct ContentGallery : View {
    let content1,content2, content3, content4 : String
    var body: some View{
        GeometryReader{
            geo in
            HStack{
                Image(content1)
                    .resizable()
                    .background(Color.blue)
                    .aspectRatio(contentMode: .fill)
                    .frame(width : geo.size.width/3, height : geo.size.height)
                    .clipped()
                Image(content2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width : geo.size.width/3, height : geo.size.height)
                    .clipped()
                Image(content3)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width : geo.size.width/3, height : geo.size.height)
                    .clipped()
            }
        }
    }
}
