//
//  NewsModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class NewsViewModel : ObservableObject {
    @Published var news = [Articles]()
    @Published var isReacheable = true
    @Published var isLoading = false
    
    init(){
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=000b512ccf01482ca6050b06eeab3777"
        
        self.isLoading = true
        AF.request(url, method: .get).responseJSON{
            response in
            
            self.isLoading = false
            switch response.result{
            case.success:
                if response.response?.statusCode == 200 {
                    let json = JSON(response.data!)
                    
                    let items = json["articles"].array!
                    
                    for i in items {
                        let title = i["title"].stringValue
                        let description = i["description"].stringValue
                        let imageUrl = i["urlToImage"].stringValue
                        
                        DispatchQueue.main.async {
                            self.news.append(Articles(title: title, description: description, urlToImage: imageUrl))
                        }
                    }
                }else{
                    self.isReacheable = false
                    print("server error \(response)")
                }
            case.failure :
                self.isReacheable = false
                print("failure : \(response as Any)")
            }
        }
    }
}
