//
//  AuthUser.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 29/8/21.
//

import Foundation
import SwiftUI

struct DataAuthUser : Codable {
    var id, access_token : String
}

struct MetaAuthUser : Codable {
    var code : Int
    var message : [String]
}

struct AuthuserResponse : Codable {
    var data : DataAuthUser
    var meta : MetaAuthUser
}

enum AlertLogin: Identifiable {
    case noInternet, errorServer,emptyField,wrongPasword
    
    var id: Int {
        hashValue
    }
}

