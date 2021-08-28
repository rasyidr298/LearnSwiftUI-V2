//
//  DrawShapeView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 28/8/21.
//

import SwiftUI

struct DrawShapeView: View {
    var body: some View {
        VStack{
            HStack{
                Circle().overlay(Circle().stroke(Color.pink, lineWidth: 5)).foregroundColor(Color.blue)
                Rectangle().stroke(Color.red, lineWidth: 5)
                Capsule().stroke(Color.red, lineWidth: 5)
                Ellipse().stroke(Color.red, lineWidth: 5)
            }.padding()
            HStack{
                RoundedRectangle(cornerRadius: 10, style: .circular).stroke(Color.red, lineWidth: 5)
                RoundedRectangle(cornerRadius: 10, style: .circular).size(width: 100, height: 50).scale(0.5, anchor: .top)
                RoundedRectangle(cornerRadius: 10, style: .circular).size(width: 100, height: 50).offset(x: 10, y: 0)
                RoundedRectangle(cornerRadius: 10, style: .circular).size(width: 100, height: 50).scale(0.5, anchor: .bottom).rotation(Angle(degrees: 20))
            }.padding()
            HStack{
                Ellipse().trim(from: 0.1, to: 0.5)
                Image("img_luffy")
                    .resizable()
                    .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Ellipse().rotation(Angle(degrees: 10)))
                    .overlay(Ellipse().rotation(Angle(degrees: 10)).stroke(Color.red, lineWidth: 5))
            }.padding()
        }
    }
}

struct DrawShapeView_Previews: PreviewProvider {
    static var previews: some View {
        DrawShapeView()
    }
}
