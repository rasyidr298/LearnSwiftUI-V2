//
//  CustomView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 2/9/21.
//

import SwiftUI


//komponen indicator
struct Indicator : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = UIColor.red
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        uiView.startAnimating()
    }
}

//loading
struct LoadingAnim : View {
    @State var message : String = ""
    var body : some View {
        VStack{
            Indicator()
            Text(self.message)
        }.padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.secondary, radius: 20)
    }
}

//Alert with two button
func alertwithTwoButton(title: String, message : String, actionTry: @escaping () -> Void, actionOk : @escaping () -> Void) -> Alert{
    return Alert(title: Text(title), message: Text(message),
                 primaryButton: .default(
                    Text("Try Again"),
                    action: actionTry
                 ),
                 secondaryButton: .destructive(
                    Text("OK"),
                    action: actionOk
                 ))
}

//Alert with one button
func alertWithOneButton(title : String, message : String) -> Alert{
    return Alert(title: Text(title), message: Text(message))
}

//Custom Shape
struct CustomShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}


struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        Indicator()
    }
}
