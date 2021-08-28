//
//  CovidView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 28/8/21.
//

import SwiftUI

struct CovidView: View {
    @ObservedObject var apiServices = ApiServices()
    
    var body: some View {
        ZStack{
            ForEach(apiServices.totalCovid){
                data in
                ContentCovid(jumlahPositif: data.jumlah_positif, jumlahMeninggal: data.jumlah_meninggal, jumlahSembuh: data.jumlah_sembuh, jumlahDirawat: data.jumlah_dirawat)
            }
        }
    }
}

struct ContentCovid : View {
    var jumlahPositif,jumlahMeninggal,jumlahSembuh,jumlahDirawat: Int
    
    var body: some View{
        GeometryReader{
            geo in
            VStack{
                HStack{
                    VStack{
                        Image(systemName: "heart.fill").foregroundColor(Color.white)
                        Text("Sembuh").font(.headline).foregroundColor(Color.white)
                        Text("\(jumlahSembuh)").font(.headline).foregroundColor(Color.white)
                    }
                    .frame(width : geo.size.width/2.2, height : geo.size.height/5)
                    .background(Color.green).cornerRadius(20)
                    
                    VStack{
                        Image(systemName: "plus.circle.fill").foregroundColor(Color.white)
                        Text("Positif").font(.headline).foregroundColor(Color.white)
                        Text("\(jumlahPositif)").font(.headline).foregroundColor(Color.white)
                    }
                    .frame(width : geo.size.width/2.2, height : geo.size.height/5)
                    .background(Color.blue).cornerRadius(20)
                }.padding()
                
                HStack{
                    VStack{
                        Image(systemName: "bed.double.fill").foregroundColor(Color.white)
                        Text("Dirawat").font(.headline).foregroundColor(Color.white)
                        Text("\(jumlahDirawat)").font(.headline).foregroundColor(Color.white)
                    }
                    .frame(width : geo.size.width/2.2, height : geo.size.height/5)
                    .background(Color.orange).cornerRadius(20)
                    
                    VStack{
                        Image(systemName: "waveform.path.ecg").foregroundColor(Color.white)
                        Text("Meninggal").font(.headline).foregroundColor(Color.white)
                        Text("\(jumlahMeninggal)").font(.headline).foregroundColor(Color.white)
                    }
                    .frame(width : geo.size.width/2.2, height : geo.size.height/5)
                    .background(Color.red).cornerRadius(20)
                }.padding()
            }
            
        }
    }
}

struct CovidView_Previews: PreviewProvider {
    static var previews: some View {
        CovidView()
    }
}

