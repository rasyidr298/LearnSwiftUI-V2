//
//  LoginView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    @EnvironmentObject var keyChainViewModel : KeychainViewModel
    
    @State var isTapLogo :Bool = false
    @State var login: String = "0706205724"
    @State var password: String = "123456"
    
    func isLogin(){authViewModel.authLogin(login: login, password: password);}
    
    var body: some View {
        //Background View
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            //1.  Welcome
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
                    .background(Color("orange"))
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
                    .background(Color("orange"))
                    .cornerRadius(15)
                    
                    //Privacy Policy
                    HStack{
                        Spacer()
                        Button(action: {}){
                            Text("Our Privacy Policy").bold().font(.callout).foregroundColor(Color("orange"))
                        }
                        Spacer()
                    }
                    .padding()
                    
                    //Register Button
                    HStack{
                        Text("Don't have an account?").bold().font(.callout).foregroundColor(.black)
                        Spacer()
                        Button(action: {}){
                            Text("Sign Up?").bold().font(.callout).foregroundColor(Color("orange"))
                        }
                    }
                    .padding()
                }.padding(30)
                
                Spacer()
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthViewModel()).environmentObject(KeychainViewModel())
    }
}

