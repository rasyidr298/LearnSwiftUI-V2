//
//  NetworkCheckView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 30/8/21.
//

import SwiftUI

struct NetworkCheckView: View {
    @EnvironmentObject var utilities : Utilities
    @State var showModal : Bool = false
    
    var body: some View {
        VStack{
            Button(action: {
                self.utilities.monitorNetwork()
                self.showModal.toggle()
            }, label: {
                Spacer()
                Text("Test Connection").foregroundColor(.white)
                Spacer()
            }).padding()
            .background(Color.blue)
            .cornerRadius(20)
            .sheet(isPresented: $showModal, content: {
                ShowModal(showModal: $showModal, isCOnnect: $utilities.isConnect)
            })
            
        }
    }
}

struct ShowModal : View {
    @Binding var showModal : Bool
    @Binding var isCOnnect : Bool
    
    var body: some View{
        if isCOnnect {
            VStack{
                Image(systemName: "wifi")
                    .resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Online..")
                Button(action: {
                    self.showModal = false
                }, label: {
                    Text("Hide")
                })
            }.background(Color.green)
        }else{
            VStack{
                Image(systemName: "wifi")
                    .resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Offlie..")
                Button(action: {
                    self.showModal = false
                }, label: {
                    Text("Hide")
                })
            }.background(Color.red)
            
        }
    }
}

struct NetworkCheckView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkCheckView().environmentObject(Utilities())
    }
}
