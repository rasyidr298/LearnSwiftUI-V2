//
//  NewsUIView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import SwiftUI
import SDWebImageSwiftUI
import SwiftUIRefresh

struct NewsView: View {
    var body: some View {
        NavigationView{
            NewsViewContent()
                .navigationBarTitle("", displayMode: .inline)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .introspectTableView {
            $0.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        }
    }
}

struct NewsViewContent : View {
    @EnvironmentObject var newsViewModel : NewsViewModel
    @State private var refreshShowing = false
    
    var body: some View{
        if !Connectivity.isConnectedToInternet() && newsViewModel.news.articles.isEmpty{
            AnyView(ReconectView(message: "Check connection..", action: {
                newsViewModel.getNews()
            }))
        }else{
            ZStack{
                if newsViewModel.isLoading {
                    LoadingAnim()
                }else{
                    List{
                        ForEach(Array(newsViewModel.news.articles.enumerated()),id:\.offset){
                            offset, data in
                            VStack{
                                Text(data.title ?? "").bold().font(.title)
                                Text(data.description ?? "").font(.body)
                                WebImage(url: URL(string: data.urlToImage ?? ""))
                                    .resizable()
                                    .placeholder(Image(systemName: "ic_swift"))
                                    .placeholder {
                                        Rectangle().foregroundColor(.gray)
                                    }
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFit()
                                    .frame(width: 300, height: 300, alignment: .center)
                            }
                        }
                    }
                    .pullToRefresh(isShowing: $refreshShowing) {
                        newsViewModel.news.articles.removeAll()
                        newsViewModel.getNews()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.refreshShowing = false
                        }
                    }
                    .onChange(of: self.refreshShowing) { value in}
                }
                
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView().environmentObject(NewsViewModel())
    }
}
