//
//  InstagramStory.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import Foundation

struct InstagramStory : Identifiable {
    let id : Int
    let imageUser : String
    let nameUser : String
    
    internal init(id: Int, imageUser: String, nameUser: String) {
        self.id = id
        self.imageUser = imageUser
        self.nameUser = nameUser
    }
}

struct InstagramContent : Identifiable {
    let id : Int
    let imageUser : String
    let nameUser : String
    let imageContent : String
    let likedBy : String
    let likedOther : String
    let favoriteContent : Bool
    
    internal init(id: Int, imageUser: String, nameUser: String, imageContent: String, likedBy: String, likedOther: String, favoriteContent: Bool) {
        self.id = id
        self.imageUser = imageUser
        self.nameUser = nameUser
        self.imageContent = imageContent
        self.likedBy = likedBy
        self.likedOther = likedOther
        self.favoriteContent = favoriteContent
    }

}
