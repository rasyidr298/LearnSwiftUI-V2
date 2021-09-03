//
//  SettingView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var keyChainViewModel : KeychainViewModel
    
    func logout(){
        self.authViewModel.isLogin = false
        self.keyChainViewModel.updateStoredToken("")
    }
    
    var body: some View {
        NavigationView{
            Form{
                //Section 1
                Section(){
                    HStack{
                        Image("img_rasyid")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .clipShape(Circle())
                        
                        //name and status
                        VStack{
                            Text("Rasyid Ridla").font(.headline)
                            Text("Tech Enthusiast").font(.caption)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                }
                
                //Section 2
                Section(header: Text("Other View")){
                    NavigationLink(destination : InstagramView()){
                        HStack(spacing: 20){
                            Image(systemName: "photo.on.rectangle.angled")
                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.purple)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Instagram")
                        }
                    }
                    
                    NavigationLink(destination : YoutubeView()){
                        HStack(spacing: 20){
                            Image(systemName: "play.tv.fill")
                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.pink)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Youtube")
                        }
                    }
                }
                
                //Section 3
                Section(header: Text("Other Feature")){
                    HStack(spacing: 20){
                        Image(systemName: "paperplane.fill")
                            .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.green)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        Text("Get Token FCM")
                    }
                    
                    Button(action: {
                        logout()
                    }, label: {
                        HStack(spacing: 20){
                            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .background(Color.red)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                            Text("Logout")
                        }
                    })
                }
                
            }.navigationTitle("Setting")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(AuthViewModel()).environmentObject(KeychainViewModel())
    }
}
