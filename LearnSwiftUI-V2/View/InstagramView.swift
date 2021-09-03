//
//  InstagramView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 3/9/21.
//

import SwiftUI

struct InstagramView: View {
    @ObservedObject var instagramViewModel = InstagramViewModel()
    
    init() {
        customNavBar()
        customTabView()
    }
    
    var body: some View{
        NavigationView{
            InstagramStoryView(instagramViewModel: instagramViewModel)
                .padding(3)
                .navigationBarItems(
                    leading: HStack{
                        Text("Instagram").font(.system(size: 25, weight: .semibold, design: .serif))
                            .italic()
                    },
                    trailing: HStack{
                        Button(action: {print("add click")}, label: {
                            Image(systemName: "plus.square")
                                .resizable()
                                .frame(width:22, height: 22, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                        })
                        
                        Button(action: {print("favorite click")}, label: {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 22, height: 22, alignment: .center)
                                .padding()
                                .foregroundColor(.black)
                        })
                        
                        ZStack{
                            Button(action: {print("messsage click")}, label: {
                                NavigationLink(destination : InstagramMessageView(instagramViewModel: instagramViewModel)){
                                    Image(systemName: "message.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                }
                            })
                            Text("\(instagramViewModel.messageCount)")
                                .foregroundColor(Color.white)
                                .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 12, weight: .light, design: .serif))
                                .padding(1)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)
                        }
                    }
                ).navigationBarTitle("", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct InstagramStoryView : View {
    @ObservedObject var instagramViewModel : InstagramViewModel
    
    let dataStory : [InstagramStory] = [
        InstagramStory(id: 1, imageUser: "img_rasyid", nameUser: "Your Story"),
        InstagramStory(id: 2, imageUser: "img_rasyid", nameUser: "Dani Carvajal"),
        InstagramStory(id: 3, imageUser: "img_rasyid", nameUser: "Benzema"),
        InstagramStory(id: 4, imageUser: "img_rasyid", nameUser: "Ronaldo"),
        InstagramStory(id: 5, imageUser: "img_rasyid", nameUser: "Messi"),
        InstagramStory(id: 6, imageUser: "img_rasyid", nameUser: "Marcelo"),
        InstagramStory(id: 7, imageUser: "img_rasyid", nameUser: "Rasyid Ridla"),
        InstagramStory(id: 8, imageUser: "img_rasyid", nameUser: "Dani Carvajal"),
        InstagramStory(id: 9, imageUser: "img_rasyid", nameUser: "Benzema"),
        InstagramStory(id: 10, imageUser: "img_rasyid", nameUser: "Ronaldo"),
    ]
    
    var body: some View{
        VStack(){
            ScrollView(.vertical, showsIndicators: false){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        ForEach(dataStory){data in
                            VStack{
                                if(data.id == 1){
                                    ZStack{
                                        Image(data.imageUser)
                                            .resizable()
                                            .frame(width: 68, height: 68)
                                            .overlay(RoundedRectangle(cornerRadius: 100)
                                                        .stroke(Color.purple, lineWidth: 4))
                                        Image(systemName:"plus.circle.fill")
                                            .resizable()
                                            .frame(width: 23, height: 23, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                            .foregroundColor(.blue)
                                            .offset(x: 25, y: 20)
                                    }
                                }else{
                                    Image(data.imageUser)
                                        .resizable()
                                        .frame(width: 68, height: 68)
                                        .overlay(RoundedRectangle(cornerRadius: 100)
                                                    .stroke(Color.purple, lineWidth: 4))
                                    
                                }
                                Text(data.nameUser)
                                    .font(.caption)
                            }.padding(.init(top: 3, leading: 6, bottom: 0, trailing: 6))
                        }
                    }
                    .padding(.init(top: 10, leading: 5, bottom: 10, trailing: 5))
                }
                .frame(height: 100, alignment: .topLeading)
                
                InstagramContentView(instagramViewModel : instagramViewModel)
            }
        }
        
    }
}

struct InstagramContentView : View {
    @ObservedObject var instagramViewModel : InstagramViewModel
    
    let dataContent : [InstagramContent] = [
        InstagramContent(id: 1, imageUser: "img_rasyid", nameUser: "Rasyid Ridla", imageContent: "img_onepiece1", likedBy: "Dani Carvajal", likedOther: "700", favoriteContent: true),
        InstagramContent(id: 2, imageUser: "img_rasyid", nameUser: "Dani Carvajal", imageContent: "img_onepiece2", likedBy: "Dani Carvajal", likedOther: "800.0000", favoriteContent: false),
        InstagramContent(id: 3, imageUser: "img_rasyid", nameUser: "Marcelo", imageContent: "img_rasyid", likedBy: "Dani Carvajal", likedOther: "100.000", favoriteContent: true),
        InstagramContent(id: 4, imageUser: "img_rasyid", nameUser: "Ronaldo", imageContent: "ic_swift", likedBy: "Dani Carvajal", likedOther: "80.000", favoriteContent: false),
        InstagramContent(id: 5, imageUser: "img_rasyid", nameUser: "Messi", imageContent: "ic_youtube", likedBy: "Dani Carvajal", likedOther: "3.000", favoriteContent: true)
    ]
    
    var body: some View{
        ForEach(dataContent){
            data in
            HStack{
                Image(data.imageUser)
                    .resizable()
                    .frame(width: 37, height: 37, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(data.nameUser).font(.footnote).bold()
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
            
            Image(data.imageContent)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                Button(action: {
                        print("favorite click")}, label: {
                            if(data.favoriteContent){
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 22, height: 22, alignment: .center)
                                    .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                                    .foregroundColor(.pink)
                            }else{
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 22, height: 22, alignment: .center)
                                    .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                                    .foregroundColor(.black)
                            }
                        })
                Button(action: {print("comment click")}, label: {
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .center)
                        .padding(.init(top: 5, leading: 5, bottom: 0, trailing: 5))
                        .foregroundColor(.black)
                })
                Button(action: {print("send click : \(self.instagramViewModel.messageCount += 1) \(instagramViewModel.messageCount)")}, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .padding(.init(top: 5, leading: 0, bottom: 0, trailing: 0))
                        .frame(width: 22, height: 22, alignment: .center)
                        .foregroundColor(.black)
                })
                Spacer()
                Button(action: {print("bookmark click")}, label: {
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .center)
                        .foregroundColor(.black)
                })
            }
            .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            HStack(spacing: 5){
                Image(data.imageUser)
                    .resizable()
                    .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Liket By").font(.caption)
                Text(data.likedBy).font(.caption).bold()
                Text("and").font(.caption)
                Text("\(data.likedOther) Other").font(.caption).bold()
                Spacer()
            }.padding(10)
        }
    }
}

struct InstagramMessageView : View {
    @ObservedObject var instagramViewModel : InstagramViewModel
    
    var body: some View{
        VStack{
            ScrollView(.vertical){
                ForEach(0..<instagramViewModel.messageCount){
                    data in
                    
                    HStack{
                        Image("img_rasyid")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                        VStack(alignment: .leading){
                            Text("rasyid ridla")
                                .font(.system(size: 14, weight: .medium, design: .default)).bold()
                            Text("Haii :)")
                                .font(.system(size: 12, weight: .light, design: .serif))
                                .italic()
                        }
                        
                        Spacer()
                        Circle()
                            .frame(width: 10, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.blue)
                            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 25, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }.padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .padding(3)
        .navigationBarItems(
            leading: HStack{
                Text("Rasyid").font(.system(size: 25, weight: .semibold, design: .serif))
                    .italic()
            },
            trailing: HStack{
                Button(action: {print("add click")}, label: {
                    Image(systemName: "video")
                        .resizable()
                        .frame(width:28, height: 22, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                })
                
                Button(action: {print("favorite click")}, label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .frame(width: 22, height: 22, alignment: .center)
                        .padding()
                        .foregroundColor(.black)
                })
                
                ZStack{
                    Button(action: {print("messsage click")}, label: {
                        Image(systemName: "message.circle")
                            .resizable()
                            .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                    })
                    Text("\(instagramViewModel.messageCount)")
                        .foregroundColor(Color.white)
                        .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 12, weight: .light, design: .serif))
                        .padding(1)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: 10, y: -10)
                }
            }
        ).navigationBarTitle("", displayMode: .inline)
    }
}

struct InstagramView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramView()
        InstagramMessageView(instagramViewModel: InstagramViewModel())
    }
}
