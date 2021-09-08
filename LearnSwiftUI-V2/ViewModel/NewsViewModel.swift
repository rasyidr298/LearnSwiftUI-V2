//
//  NewsModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import Foundation
import Alamofire
import Combine

class NewsViewModel : ObservableObject {
    
    @Published var isLoading = false
    
    var didChange = ObservableObjectPublisher()
    @Published var news = NewsResponse(articles: []){
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        self.isLoading = true
        getNews()
    }
    
    func getNews(){
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=000b512ccf01482ca6050b06eeab3777"
        
        if !Connectivity.isConnectedToInternet(){
            
        }else{
            NetworkManager(data: [:], headers: [:], url: url, service: .none, method: .get, isJSONRequest: false).executeQuery{
                (result : Result<NewsResponse, Error>) in
                self.isLoading = false
                
                switch result{
                case .success(let response) :
                    
                    print("succes get news : \(response.articles.count)")
                    DispatchQueue.main.async {
                        self.news = response
                    }
                    
                case .failure(let error):
                    print("error get news : \(error)")
                }
            }
        }
        
    }
}
