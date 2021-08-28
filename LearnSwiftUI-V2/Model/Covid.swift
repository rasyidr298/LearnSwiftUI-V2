//
//  Covid.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 28/8/21.
//

import Foundation
import SwiftUI

struct Total : Codable, Identifiable{
    let id = UUID()
    var jumlah_positif, jumlah_meninggal, jumlah_sembuh, jumlah_dirawat: Int
}

struct Update : Codable{
    var total: Total
}

struct CovidResponse : Codable{
    var update : Update
}
