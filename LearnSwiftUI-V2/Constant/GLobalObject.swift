//
//  GLobalObject.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import Foundation

class GlobalObject: ObservableObject {
    
    //Login app
    @Published var isLogin : Bool = false
    @Published var isCorrect : Bool = true
}
