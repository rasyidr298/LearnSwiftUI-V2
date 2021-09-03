//
//  NewsUIView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    @EnvironmentObject var newsViewModel : NewsViewModel
    
    var body: some View {
        if newsViewModel.isLoading {
            VStack{
                Indicator()
                Text("Loading..")
            }.padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.secondary, radius: 20)
        }else{
            if newsViewModel.isReacheable {
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
            }else{
                VStack{
                    Indicator()
                    Text("Server Error..")
                }.padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.secondary, radius: 20)
            }
        }
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView().environmentObject(NewsViewModel())
    }
}
