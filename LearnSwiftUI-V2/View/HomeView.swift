//
//  HomeView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var biometricAuth : BiometricAuthentication
    
    var body: some View{
        ZStack{
            
            if biometricAuth.isLocked {
                LoadingAnim()
            }else{
                TabView(){
                    NewsView()
                        .tabItem {
                            Image(systemName: "text.badge.plus")
                            Text("News")
                        }
                    
                    TaskView()
                        .tabItem {
                            Image(systemName: "tray.and.arrow.down.fill")
                            Text("Local Data")
                        }
                    TaskView()
                        .tabItem {
                            Image(systemName: "paperplane.circle.fill")
                            Text("Firebase")
                        }
                    SettingView()
                        .tabItem {
                            Image(systemName: "wrench.and.screwdriver.fill")
                            Text("Setting")
                        }
                }.accentColor(.red)
                
            }
            
        }
        .onAppear{
            if biometricAuth.isLocked{
                biometricAuth.tryBiometricAuthentication()
            }
        }
        
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(AuthViewModel())
            .environmentObject(KeychainViewModel())
            .environmentObject(TaskViewModel())
            .environmentObject(NewsViewModel())
            .environmentObject(ExamViewModel())
    }
}
