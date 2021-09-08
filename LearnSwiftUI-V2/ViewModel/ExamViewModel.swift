//
//  QuestionsViewModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 4/9/21.
//

import Foundation
import Alamofire
import SwiftUI
import Combine

class ExamViewModel: ObservableObject {
    var keyChainViewModel = KeychainViewModel()
    @Published var isLoading : Bool = false
    
    var didChange = ObservableObjectPublisher()
    @Published var questions = QuestionsResponse(data: []){
        didSet {
            objectWillChange.send()
        }
    }
    
    init() {
        self.isLoading = true
        getQuestions()
        self.isLoading = false
    }
    
    func getQuestions() {
        let tokenHeader = ["Authorization" : keyChainViewModel.getStoredToken()]
        
        if !Connectivity.isConnectedToInternet(){
            
        }else{
            NetworkManager(data: [:], headers: tokenHeader, url: nil, service: .listQuestions, method: .get, isJSONRequest: false).executeQuery {
                (result : Result<QuestionsResponse, Error>) in
                
                self.isLoading = false
                
                switch result{
                
                case .success(let result) :
                    print("succes get questions : \(result.data.count)")
                    
                    DispatchQueue.main.async {
                        self.questions = result
                    }
                    
                case .failure(let error) :
                    print("error get questions : \(error)")
                    
                }
            }
            
        }
    }
}
