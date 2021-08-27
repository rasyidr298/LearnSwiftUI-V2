//
//  LoginView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var globalObject : GlobalObject
    
    var body: some View {
        VStack(spacing: 30){
            if self.globalObject.isLogin {
                Home()
            }else{
                Logo()
                LoginForm()
            }
        }
        .padding(.all, 20)
    }
}

struct Logo : View {
    var body: some View{
        VStack{
            Image("ic_swift")
                .resizable()
                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .padding()
            .background(Color.blue)
                .cornerRadius(20)
            
            Text("Hello SwiftUI")
                .foregroundColor(Color.orange)
        }
        
    }
}

struct LoginForm : View{
    
    @EnvironmentObject var globalObject : GlobalObject
    
    @State var username: String = ""
    @State var password: String = ""
    
    func login(){
        if (username == "Admin" && password == "12345") {
            globalObject.isLogin = true
        }else{
            globalObject.isLogin = false
            globalObject.isCorrect = false
        }
    }
    
    var body: some View{
        VStack(alignment:.leading){
            
//            tf username
            Text("username").font(.callout).bold()
            TextField("username..", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
//            tf password
            Text("password").font(.callout).bold()
            SecureField("password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            //error message
            if(globalObject.isCorrect == false){
                Text("Password Salah").foregroundColor(Color.red)
            }
//
//            btn
            Button(action: {print("login click\(self.login())")}, label: {
                HStack{
                    Text("Sign In")
                    Spacer()
                }
            })
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(Color.white)
        }
        .padding(.all, 30)
            .background(Color.orange)
            .cornerRadius(10)
    }
}

struct Home : View {
    @EnvironmentObject var globalObject : GlobalObject
    
    var body: some View{
        VStack{
            Text("Halaman Home")
            Button(action: {self.globalObject.isLogin = false}, label: {
                Text("Logout")
            })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(GlobalObject())
    }
}
