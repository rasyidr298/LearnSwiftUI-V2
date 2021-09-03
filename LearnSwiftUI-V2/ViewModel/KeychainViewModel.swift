//
//  KeychainViewModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import Foundation

class KeychainViewModel: ObservableObject {
    
    var isTokenBlank: Bool {
        getStoredToken() == ""
    }
    
    func getStoredToken() -> String {
        let kcw = KeychainWrapper()
        if let token = try? kcw.getGenericTokenFor(
            account: "RWQuickNote",
            service: "unlockToken") {
            return token
        }
        
        return ""
    }
    
    func updateStoredToken(_ token: String) {
        let kcw = KeychainWrapper()
        do {
            try kcw.storeGenericTokenFor(
                account: "RWQuickNote",
                service: "unlockToken",
                token: token)
        } catch let error as KeychainWrapperError {
            print("Exception setting token: \(error.message ?? "no message")")
        } catch {
            print("An error occurred setting the token.")
        }
    }
    
    func validateToken(_ token: String) -> Bool {
        let currentToken = getStoredToken()
        return token == currentToken
    }
    
    func changeToken(currentToken: String, newToken: String) -> Bool {
        guard validateToken(currentToken) == true else { return false }
        updateStoredToken(newToken)
        return true
    }
}
