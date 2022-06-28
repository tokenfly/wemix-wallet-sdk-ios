//
//  AppDelegate.swift
//  WemixWalletSDK-iOS
//
//  Created by jinsik on 05/18/2022.
//  Copyright (c) 2022 jinsik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var requestID: String?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationCenter.default.post(name: Notification.Name("applicationWillEnterForeground"), object: nil, userInfo: nil)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        guard let component = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return false
        }
        
        if !component.host!.isEqual("result") {
            return false
        }
        
        self.getResultIdFromComponent(component: component)
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let component = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return false
        }
        
        if !component.host!.isEqual("result") {
            return false
        }
        
        self.getResultIdFromComponent(component: component)
        
        return true
    }
    

    func getResultIdFromComponent(component: URLComponents) {
        
        guard let requestId = component.queryItems?.first(where: { $0.name == "requestId"})?.value else {
            return
        }
        
        self.requestID = requestId
    }
    
    

}

