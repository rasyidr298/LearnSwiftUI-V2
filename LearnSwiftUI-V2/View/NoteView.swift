//
//  NoteView.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 30/8/21.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        NavigationView{
            NoteHome()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NoteHome : View{
    
    //    @State private var tfTitle = ""
    @EnvironmentObject var noteViewModel : NoteViewModel
    @State private var editMode = EditMode.inactive
    
    var body: some View{
        VStack{
            HStack{
                TextField("enter title", text: $noteViewModel.newTitle ).textFieldStyle(RoundedBorderTextFieldStyle())
                btnAdd
            }.padding(.horizontal)
            
            List{
                ForEach(Array(noteViewModel.notes.enumerated()),id:\.offset){
                    offset , note in
                    NavigationLink(destination: DetailNote(note: note, index: offset)){
                        Text(note.title)
                    }
                }
                .onDelete(perform: noteViewModel.deleteNote)
                .onMove(perform : noteViewModel.onMove)
            }
        }
        .navigationTitle("List")
        .navigationBarItems(leading: EditButton())
        .environment(\.editMode, $editMode)
    }
    
    private var btnAdd : some View{
        switch editMode{
        case .inactive:
            return AnyView(Button(action: {
                self.noteViewModel.addData(title: self.noteViewModel.newTitle)
            }, label: {
                Image(systemName: "plus")
            }).padding().background(Color.orange).foregroundColor(.white).cornerRadius(5))
        default:
            return AnyView(EmptyView())
        }
    }
}

struct DetailNote : View {
    @EnvironmentObject var noteViewModel : NoteViewModel
    @State var newTitleValue : String = ""
    var note : Note
    let index : Int
    
    var body: some View{
        VStack (alignment: .leading, spacing: nil, content: {
            TextField("update", text : $newTitleValue).textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear{self.newTitleValue = self.note.title}
            Button(action: {
                self.noteViewModel.onUpdate(index: index, title: self.newTitleValue)
            }, label: {
                Spacer()
                Text("Update").padding()
                Spacer()
            })
            Spacer()
        })
        .padding(.horizontal)
        .navigationTitle("Detail Note")
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView().environmentObject(NoteViewModel())
    }
}
