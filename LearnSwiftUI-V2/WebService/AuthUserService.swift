//
//  GLobalObject.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

class AuthUserService: ObservableObject {
    
    //Login app
    var didChange = PassthroughSubject<AuthUserService, Never>()
    
    @Published var alertLogin: AlertLogin?
    
    @Published var isLogin : Bool = false{
        didSet{
            didChange.send(self)
        }
    }
    
    @Published var isLoading : Bool = false
    @Published var token : String = ""
    
    func login(login : String, password : String){
        
        let body = ["login":login,"password":password]
        
        self.isLoading = true
        AF.request("http://157.230.241.48/api/v2/authenticate", method: .post, parameters:body, encoding: URLEncoding.httpBody, headers: nil).responseJSON{
            response in
            
            self.isLoading = false
            switch response.result {
            
            case .success:
                let result = try? JSONDecoder().decode(AuthuserResponse.self, from: response.data!)
                
                DispatchQueue.main.async {
                    if(result?.meta.code == 200){
                        print("response 200 : \(response as Any)")
                        self.token = (result?.data.access_token)!
                        self.isLogin = true
                    }else{
                        print("response other 200 : \(response as Any)")
                        self.alertLogin = .wrongPasword
                    }
                }
                
                break
            case .failure(let error):
                self.alertLogin = .errorServer
                print("error : \(error)")
            }
            
        }
    }
}
