//
//  SceneDelegate.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 27/8/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        // Create the SwiftUI view that provides the window contents.
                let authUserService = AuthUserService()
                let utilities = Utilities()
//        let noteViewModel = NoteViewModel()
        
//        let newsView = NewsView()
//        let noteView = NoteView()
        //        let networkCheckView = NetworkCheckView()
                let loginView = LoginView()
        //        let galleryView = GalleryView()
        //        let lotteryView = LotteryView()
        //        let drawShapeView = DrawShapeView()
        //        let covidView = CovidView()
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = UIHostingController(rootView: newsView)
//            window.rootViewController = UIHostingController(rootView: noteView.environmentObject(noteViewModel))
            //            window.rootViewController = UIHostingController(rootView: networkCheckView.environmentObject(utilities))
                        window.rootViewController = UIHostingController(rootView: loginView.environmentObject(authUserService)
                                                                            .environmentObject(utilities))
            //            window.rootViewController = UIHostingController(rootView: galleryView)
            //            window.rootViewController = UIHostingController(rootView: lotteryView)
            //            window.rootViewController = UIHostingController(rootView: drawShapeView)
            //            window.rootViewController = UIHostingController(rootView: covidView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}
