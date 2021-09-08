//
//  CustomView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 2/9/21.
//

import SwiftUI
import Lottie


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
    @Environment(\.colorScheme) var colorScheme
    var body : some View {
        if colorScheme == .dark {
            VStack{
                Indicator()
                Text("loading..")
            }.padding()
            .background(Color.black)
            .cornerRadius(20)
            .shadow(color: Color.secondary, radius: 10)
        }else{
            VStack{
                Indicator()
                Text("loading..")
            }.padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.secondary, radius: 10)
            
        }
    }
}

//lootieView
struct LootieView: UIViewRepresentable {
    typealias UIViewType = UIView
    var fileName : String
    
    func makeUIView(context: UIViewRepresentableContext<LootieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named(fileName)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([animationView.widthAnchor.constraint(equalTo: view.widthAnchor), animationView.heightAnchor.constraint(equalTo: view.heightAnchor)])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LootieView>) {
    }
}

//button reconnect
struct ReconectView : View {
    @State var message : String = ""
    @State var action : () -> Void
    
    var body: some View{
        VStack{
            LootieView(fileName: "noConnection")
                .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(message)
            Button {
                action()
            } label: {
                Text("retry")
            }
        }
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

//custom white NavBar
func customNavBar(){
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.shadowImage = UIImage()
    navBarAppearance.shadowColor = .clear
//    navBarAppearance.backgroundColor = UIColor.white
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().compactAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
}

//custom TabView
func customTabView(){
    let tabBarAppeareance = UITabBarAppearance()
//        tabBarAppeareance.shadowColor = .gray // For line separator of the tab bar
    tabBarAppeareance.backgroundColor = .white // For background color
    UITabBar.appearance().standardAppearance = tabBarAppeareance
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
        ReconectView(message: "tidak ada internet") {
            
        }
    }
}
