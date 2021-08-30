//
//  ViewModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 30/8/21.
//

import Foundation

class NoteViewModel: ObservableObject {
    @Published var newTitle : String = ""
    @Published var notes : [Note] = []
    
    func addData(title : String){
        notes.append(Note(title: title))
        self.newTitle = ""
    }
    
    func deleteNote(offset : IndexSet){
        notes.remove(atOffsets: offset)
    }
    
    func onMove(source : IndexSet, destination: Int){
        notes.move(fromOffsets: source, toOffset: destination)
    }
    
    func onUpdate(index: Int, title: String){
        notes[index].title = title
    }
}
