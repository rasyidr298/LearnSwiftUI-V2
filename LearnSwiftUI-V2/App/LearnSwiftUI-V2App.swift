//
//  LearnSwiftUI-V2App.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 8/9/21.
//

import SwiftUI

@main
struct LearnSwiftUIV2App: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
                .environmentObject(KeychainViewModel())
                .environmentObject(TaskViewModel())
                .environmentObject(NewsViewModel())
                .environmentObject(ExamViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
