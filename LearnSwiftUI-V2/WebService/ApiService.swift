//
//  ApiService.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 28/8/21.
//

import Foundation
import SwiftUI
import Combine

class ApiServices: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var totalCovid = [Total]() {
        willSet {
            objectWillChange.send()
        }
    }
    

    init(){
        guard let url = URL(string: "https://data.covid19.go.id/public/api/update.json") else {
            fatalError("INVALID URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let result = try? JSONDecoder().decode(CovidResponse.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.totalCovid = [result.update.total]
                    
                    print(result)
                    
                }
            }
        }.resume()
    }
}
