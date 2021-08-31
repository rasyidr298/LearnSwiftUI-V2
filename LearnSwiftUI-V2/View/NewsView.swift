//
//  NewsUIView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    @ObservedObject var newsViewModel = NewsViewModel()
    
    var body: some View {
        List(newsViewModel.news){data in
            VStack{
                Text("\(data.title)").bold().font(.title)
                Text("\(data.description)").font(.body)
                WebImage(url: URL(string: data.urlToImage))
                    .resizable()
                    .placeholder(Image(systemName: "ic_swift"))
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .center)
            }
        }
        
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
