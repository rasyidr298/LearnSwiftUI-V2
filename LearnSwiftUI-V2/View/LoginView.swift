//
//  LoginView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authUserService : AuthUserService
    
    var body: some View {
        VStack(spacing: 30){
            if self.authUserService.isLogin {
                Home()
            }else{
                Logo()
                LoginForm().animation(.easeIn)
            }
        }
        .padding(.all, 20)
    }
}

struct Logo : View {
    
    @State var isTapLogo :Bool = false
    
    var body: some View{
        VStack{
            if !isTapLogo {
                Image("ic_swift")
                    .resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .onTapGesture {
                        if(!isTapLogo){
                            self.isTapLogo = true
                            print("logo click \(self.isTapLogo)")
                        }else{
                            self.isTapLogo = false
                            print("logo click \(self.isTapLogo)")
                        }
                    }
            }else{
                Image("ic_swift")
                    .resizable()
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
                    .onTapGesture {
                        if(!isTapLogo){
                            self.isTapLogo = true
                            print("logo click \(self.isTapLogo)")
                        }else{
                            self.isTapLogo = false
                            print("logo click \(self.isTapLogo)")
                        }
                    }
            }
            
            Text("Hello SwiftUI")
                .foregroundColor(Color.black)
        }
        
    }
}

struct LoginForm : View{
    
    @EnvironmentObject var authUserService : AuthUserService
    
    @State var login: String = "0706205724"
    @State var password: String = "123456"
    @State var isEmptyField: Bool = false
    
    var body: some View{
        ZStack{
            VStack(alignment: .leading, spacing: 20){
                
                //tf username
                Text("username").font(.callout).bold()
                    .foregroundColor(Color.white)
                TextField("username..", text: $login)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.numberPad)
                
                //tf password
                Text("password").font(.callout).bold()
                    .foregroundColor(Color.white)
                TextField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                //btn
                Button(action: {
                    print("login click")
                    if(self.login.isEmpty || self.password.isEmpty){
                        self.isEmptyField = true
                    }else{
                        authUserService.login(login: self.login, password: self.password)
                    }
                }, label: {
                    HStack{
                        Spacer()
                        Text("Sign In")
                        Spacer()
                    }
                })
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(Color.white)
                .shadow(color: .gray, radius: 5)
                
                //wrong field message
                if(authUserService.isCorrect == false){
                    Text("Password Salah!").foregroundColor(Color.white)
                }
                
                //wrong empty field
                if(isEmptyField){
                    Text("Form Harus Diisi!").foregroundColor(Color.white)
                }
                
                //is not reachable
                if(authUserService.isReacheable == false){
                    Text("Server bermaslah!").foregroundColor(Color.white)
                }
            }
            .padding(.all, 30)
            .background(Color("orange"))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 5)
            
            if(authUserService.isLoading){
                VStack{
                    Indicator()
                    Text("Loading..")
                }.padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.secondary, radius: 20)
            }
        }
    }
}

struct Home : View {
    @EnvironmentObject var authUserService : AuthUserService
    
    var body: some View{
        VStack{
            Text("Halaman Home")
            Button(action: {self.authUserService.isLogin = false}, label: {
                Text("Logout")
            })
            Text(self.authUserService.token)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthUserService())
    }
}
