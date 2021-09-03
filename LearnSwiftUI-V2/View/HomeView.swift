//
//  HomeView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View{
        ZStack{
            TabView{
                NewsView()
                    .tabItem {
                        Image(systemName: "text.badge.plus")
                        Text("Questions")
                    }
                NoteView()
                    .tabItem {
                        Image(systemName: "tray.and.arrow.down.fill")
                        Text("Beranda")
                    }
                NoteView()
                    .tabItem {
                        Image(systemName: "paperplane.circle.fill")
                        Text("Beranda")
                    }
                SettingView()
                    .tabItem {
                        Image(systemName: "wrench.and.screwdriver.fill")
                        Text("Beranda")
                    }
            }.accentColor(.red)
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
