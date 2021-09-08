//
//  Newa.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import Foundation

struct Articles : Codable, Identifiable {
    var id = UUID()
    var title, description, urlToImage : String?
    
    enum CodingKeys : CodingKey {
        case title, description, urlToImage
    }
}

struct NewsResponse : Codable {
    var articles : [Articles]
}
