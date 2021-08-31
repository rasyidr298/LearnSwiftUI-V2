//
//  Newa.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 31/8/21.
//

import Foundation

struct Articles : Identifiable {
    var id = UUID()
    var title, description, urlToImage : String
}

struct NewsResponse {
    var articles : Articles
}
