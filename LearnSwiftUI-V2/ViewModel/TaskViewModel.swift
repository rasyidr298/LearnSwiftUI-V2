//
//  ViewModel.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 30/8/21.
//

import Foundation
import CoreData

class TaskViewModel: ObservableObject {
    @Published var content : String = ""
    
    @Published var date = Date()
    
    @Published var isNewData = false
    
    @Published var updateItem : Task!
    
    let calender = Calendar.current
    
    
    func checkDate() -> String{
        if calender.isDateInToday(date){
            return "today"
        }
        else if calender.isDateInTomorrow(date){
            return "tomorrow"
        }
        else{
            return "other day"
        }
    }
    
    func updateDate(value : String){
        if  value == "today" {
            date = Date()
        }
        else if value == "tomorrow"{
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }
        else{
            
        }
    }
    
    func addTask(context : NSManagedObjectContext){
        
        //update
        if updateItem != nil {
            updateItem.date = date
            updateItem.content = content
            
            try! context.save()
            updateItem = nil
            isNewData.toggle()
            
            content = ""
            date = Date()
            
            return
            
        }
        
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        do{
            try context.save()
            isNewData.toggle()
            
            content = ""
            date = Date()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func updateTask(item : Task){
        updateItem = item
        
        date = item.date!
        content = item.content!
        isNewData.toggle()
    }
}
