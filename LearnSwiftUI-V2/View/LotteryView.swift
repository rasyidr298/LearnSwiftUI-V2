//
//  LotteryView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 28/8/21.
//

import SwiftUI

struct LotteryView: View {
    @State private var showTicket = false
    @State private var offsetTicket = CGSize.zero
    
    var body: some View {
        let dragTicket = DragGesture()
            .onChanged{
                gesture in
                self.offsetTicket = gesture.translation
            }
            .onEnded{
                value in
                self.offsetTicket = CGSize.zero
                self.showTicket = false
            }
        
        return ZStack{
            Color.orange
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("ic_swift")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Button(action: {
                    withAnimation{
                        showTicket.toggle()
                    }
                }, label: {
                    Spacer()
                    Text("Klik disini untuk mendapatkan Kupon Gratis")
                    Spacer()
                })
                .padding()
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
            }.padding()
            
            if showTicket {
                TicketView()
                    .transition(.move(edge: .bottom)).animation(.linear)
                    .offset(y: self.offsetTicket.height)
                    .gesture(dragTicket)
            }
        }
    }
}

struct LotteryView_Previews: PreviewProvider {
    static var previews: some View {
        LotteryView()
    }
}


struct TicketView : View {
    var body: some View{
        VStack{
            Text("Selamat Anda Mendapakan Tiket Penerbangan ke Wakanda Gratis")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(Color.white)
        }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(Color.blue)
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.bottom)
    }
}
