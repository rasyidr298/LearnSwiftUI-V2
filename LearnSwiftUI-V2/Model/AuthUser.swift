//
//  AuthUser.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 29/8/21.
//

import Foundation
import SwiftUI

struct Data : Codable {
    var id, access_token : String
}

struct Meta : Codable {
    var code : Int
    var message : [String]
}

struct AuthuserResponse : Codable {
    var data : Data
    var meta : Meta
}

enum AlertLogin: Identifiable {
    case noInternet, errorServer,emptyField,wrongPasword
    
    var id: Int {
        hashValue
    }
}

