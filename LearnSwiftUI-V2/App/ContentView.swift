//
//  ContentView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 2/9/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var keyChainViewModel : KeychainViewModel
    
    var body: some View {
        if authViewModel.isLoading{
            return AnyView(LoadingAnim(message: "Loading.."))
        }else{
            if (self.keyChainViewModel.isTokenBlank) {
                return AnyView(LoginView().animation(.easeIn))
            }else{
                return AnyView(HomeView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel()).environmentObject(KeychainViewModel())
    }
}
