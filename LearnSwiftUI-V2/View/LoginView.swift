//
//  LoginView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        if authViewModel.isLoading{
            LoadingAnim(message: "loading..")
        }else{
            if (self.authViewModel.isLogin) {
                Home()
            }else{
                LoginForm().animation(.easeIn)
            }
        }
    }
}

struct LoginForm : View{
    @EnvironmentObject var authViewModel : AuthViewModel
    
    @State var isTapLogo :Bool = false
    @State var login: String = "0706205724"
    @State var password: String = "123456"
    
    func isLogin(){authViewModel.authLogin(login: login, password: password);}
    
    func isOk(){}
    
    var body: some View {
        //Background View
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            //1. Purple Welcome
            VStack{
                if !isTapLogo {
                    HStack{
                        HStack{
                            VStack(alignment:.leading){
                                Text("Hi!").bold().font(.largeTitle).foregroundColor(.white)
                                Text("Welcome Back").font(.title).foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                    .frame(height: 180)
                    .padding(30)
                    .background(Color.purple)
                    .clipShape(CustomShape(corner: .bottomRight, radii: 50))
                    .edgesIgnoringSafeArea(.top)
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
                    HStack{
                        HStack{
                            VStack(alignment:.leading){
                                Text("Hi!").bold().font(.largeTitle).foregroundColor(.white)
                                Text("Welcome Back").font(.title).foregroundColor(.white)
                            }
                        }
                        Spacer()
                    }
                    .frame(height: 180)
                    .padding(30)
                    .background(Color.pink)
                    .clipShape(CustomShape(corner: .bottomRight, radii: 50))
                    .edgesIgnoringSafeArea(.top)
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
                
                //Form Field
                VStack(alignment:.leading){
                    //Username
                    Text("Username/email Address")
                    TextField("Username...", text: $login)
                        .padding()
                        .background(Color("lightGray"))
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
                    
                    //Password
                    Text("Password")
                    SecureField("Password...", text: $password)
                        .padding()
                        .background(Color("lightGray"))
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
                    
                    //Forgot Password
                    HStack{
                        Button(action:{}){
                            Text("Forgot Password?")
                        }
                        Spacer()
                    }.padding([.top,.bottom], 10)
                    
                    //Sign In Button
                    HStack{
                        Spacer()
                        Button(action: {
                            if(self.login.isEmpty || self.password.isEmpty){
                                isLogin()
                            }else {
                                self.isLogin()
                            }
                        })
                        {
                            Text("Sign In").bold().font(.callout).foregroundColor(.white)
                        }
                        .alert(item: $authViewModel.alertLogin) { type in
                            switch type {
                            case .noInternet:
                                return alertWithOneButton(title: "no internet", message: "no internet Connection bro..")
                            case .errorServer:
                                return alertWithOneButton(title: "server error", message: "server error broo..")
                            case .emptyField:
                                return alertWithOneButton(title: "empty field", message: "empty field broo..")
                            case .wrongPasword:
                                return alertWithOneButton(title: "wrong account", message: "wrong password or email broo..")
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(15)
                    
                    //Privacy Policy
                    HStack{
                        Spacer()
                        Button(action: {}){
                            Text("Our Privacy Policy").bold().font(.callout).foregroundColor(.purple)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    //Register Button
                    HStack{
                        Text("Don't have an account?").bold().font(.callout).foregroundColor(.black)
                        Spacer()
                        Button(action: {}){
                            Text("Sign Up?").bold().font(.callout).foregroundColor(.purple)
                        }
                    }
                    .padding()
                }.padding(30)
                
                Spacer()
            }
            
            
        }
    }
}

struct Home : View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View{
        VStack{
            Text("Halaman Home")
            Button(action: {
                self.authViewModel.isLogin = false
                
            }, label: {
                Text("Logout")
            })
            Text(self.authViewModel.token)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel())
    }
}

