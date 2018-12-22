//
//  AppDelegate.swift
//  SciTube
//
//  Created by Tobiao on 22.12.2018.
//  Copyright © 2018 ITWhite. All rights reserved.
//

import UIKit
import RealmSwift
#if DEBUG
import FLEX
#endif

private struct Action {
    private init() {}
    
    static let flexTapGestureAction = #selector(AppDelegate.handleThreeFingerTap(tapRecognizer:))
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    #if DEBUG
    private var flexGestureRecognizer: UITapGestureRecognizer? = nil {
        didSet {
            if let tapRecognizer = flexGestureRecognizer {
                window?.addGestureRecognizer(tapRecognizer)
            }
        }
    }
    #endif

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = prepareRootViewController()
        window!.makeKeyAndVisible()
        
        setDefaultRealm()
        
        #if DEBUG
        setFlexTapGesture()
        #endif
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate {
    
    private func prepareRootViewController() -> UINavigationController {
        let rootViewController = MoviesListViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        return navigationController
    }
    
    /// Configures Realm with default setting
    func setDefaultRealm() {
        let newSchemaVersion: UInt64 = 1
        let config = Realm.Configuration(schemaVersion: newSchemaVersion, migrationBlock: { migration, oldSchemaVersion in
            if oldSchemaVersion < newSchemaVersion {
            }
        })
        Realm.Configuration.defaultConfiguration = config
    }
}

// MARK: - FLEX
#if DEBUG
private extension AppDelegate {
    
    func setFlexTapGesture() {
        flexGestureRecognizer = UITapGestureRecognizer(target: self, action: Action.flexTapGestureAction)
        flexGestureRecognizer?.numberOfTapsRequired = 2
        flexGestureRecognizer?.numberOfTouchesRequired = 3
    }
    
    @objc func handleThreeFingerTap(tapRecognizer: UITapGestureRecognizer) {
        if tapRecognizer.state == .recognized {
            FLEXManager.shared().showExplorer()
        }
    }
}
#endif
