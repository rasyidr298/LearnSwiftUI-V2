//
//  AuthViewModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

class AuthViewModel : ObservableObject{
    
    var keyChainViewModel = KeychainViewModel()
    @Published var alertLogin: AlertLogin?
    @Published var isLoading : Bool = false
    
    var didChange = PassthroughSubject<AuthViewModel, Never>()
    @Published var isLogin : Bool = false{
        didSet{
            didChange.send(self)
        }
    }
    
    func authLogin(login: String, password : String){
        if !Connectivity.isConnectedToInternet(){
            self.alertLogin = .noInternet
        }else{
            self.isLoading = true
            NetworkManager(data: ["login":login,"password":password], headers: [:], url: nil, service: .loginAuth, method: .post, isJSONRequest: false).executeQuery(){
                (result: Result<AuthuserResponse,Error>) in
                
                self.isLoading = false
                switch result{
                case .success(let response):
                    print("authLogin succes :\(response)")
                    DispatchQueue.main.async {
                        self.isLogin = true
                        self.keyChainViewModel.updateStoredToken(response.data.access_token) 
                    }
                    
                case.failure(let error):
                    self.alertLogin = .wrongPasword
                    print("authLogin error :\(error)")
                }
            }
        }
    }
}
