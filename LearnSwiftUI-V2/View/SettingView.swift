//
//  SettingView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import SwiftUI

struct SettingView: View {
    
    var body: some View {
        NavigationView{
            SettingViewContent()
                .navigationBarTitle("", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
        .introspectTableView {
            $0.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        }
    }
}

struct SettingViewContent : View {
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var keyChainViewModel : KeychainViewModel
    
    func logout(){
        self.authViewModel.isLogin = false
        self.keyChainViewModel.updateStoredToken("")
    }
    
    var body: some View{
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
                        Image(systemName: "livephoto.play")
                            .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        Text("Instagram")
                    }
                }
//                .navigationBarTitle("", displayMode: .inline)
                
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
//                .navigationBarTitle("", displayMode: .inline)
                
                NavigationLink(destination : DrawShapeView()){
                    HStack(spacing: 20){
                        Image(systemName: "square.fill.on.circle.fill")
                            .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        Text("Draw Shape")
                    }
                }
//                .navigationBarTitle("", displayMode: .inline)
            }
            
            //Section 3
            Section(header: Text("Other Feature")){
                
                NavigationLink(destination : QuestionsView()){
                    HStack(spacing: 20){
                        Image(systemName: "square.fill.on.circle.fill")
                            .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        Text("Questions")
                    }
                }
//                .navigationBarTitle("", displayMode: .inline)
                
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
                        Text("Logout").foregroundColor(.red)
                    }
                })
            }
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView().environmentObject(AuthViewModel()).environmentObject(KeychainViewModel())
    }
}
