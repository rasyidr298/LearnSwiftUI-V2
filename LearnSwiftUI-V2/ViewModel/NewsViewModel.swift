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
    
    init(){
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2021-07-31&sortBy=publishedAt&apiKey=000b512ccf01482ca6050b06eeab3777"
        
        AF.request(url, method: .get).responseJSON{
            response in
            
            switch response.result{
            
            case.success:
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
            case.failure :
                print("failure : \(response as Any)")
            }
        }
    }
}
