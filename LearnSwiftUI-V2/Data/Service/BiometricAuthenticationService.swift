//
//  BiometricAuthenticationService.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 8/9/21.
//

import Foundation
import LocalAuthentication

class BiometricAuthentication: ObservableObject {
    
    @Published var isLocked = true{
        didSet {
            objectWillChange.send()
        }
    }
    
    
    func getBiometricType() -> String {
        let context = LAContext()
        
        _ = context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: nil)
        switch context.biometryType {
        case .faceID:
            return ""
        case .touchID:
            // In iOS 14 and later, you can use "touchid" here
            return ""
        case .none:
            return ""
        @unknown default:
            return ""
        }
    }
    
    func tryBiometricAuthentication() {
        // 1
        let context = LAContext()
        var error: NSError?
        
        // 2
        if context.canEvaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            error: &error) {
            // 3
            let reason = "Authenticate to unlock your App."
            context.evaluatePolicy(
                .deviceOwnerAuthentication,
                localizedReason: reason) { authenticated, error in
                // 4
                DispatchQueue.main.async {
                    if authenticated {
                        // 5
                        self.isLocked = false
                    } else {
                        // 6
                        if let errorString = error?.localizedDescription {
                            print("Error in biometric policy evaluation: \(errorString)")
                        }
                        
                        exit(0)
                        //                self.isLocked = true
                    }
                }
            }
        } else {
            // 7
            if let errorString = error?.localizedDescription {
                print("Error in biometric policy evaluation:: \(errorString)")
            }
            
            self.isLocked = false
            //        self.isLocked = true
        }
    }
    
}
