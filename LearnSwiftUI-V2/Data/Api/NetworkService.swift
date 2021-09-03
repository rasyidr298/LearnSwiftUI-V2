//
//  NetworkService.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import Foundation

// MARK: services
enum services :String{
    case loginAuth = "authenticate"
    case listQuestions = "exam/question/"
}

// MARK: baseURL
var baseURL: String {
    switch NetworkManager.networkEnviroment {
        case .dev: return "http://157.230.241.48/api/v2/"
        case .production: return "http://157.230.241.48/api/v2/"
        case .stage: return "http://157.230.241.48/api/v2/"
    }
}

class NetworkService : NSObject{
    
}
