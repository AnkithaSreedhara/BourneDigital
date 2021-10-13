//
//  SceneDelegate.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
            guard let splitViewController = self.window?.rootViewController as? UISplitViewController else {
                fatalError("Missing SplitViewController")
            }

            guard let masterNavController = splitViewController.viewControllers.first as? UINavigationController,
                let masterViewController = masterNavController.topViewController as? MoviesCollectionViewController else {
                fatalError("Missing MasterViewController")
            }

            guard let navigationController = splitViewController.viewControllers.last as? UINavigationController,
                let detailViewController = navigationController.topViewController else {
                fatalError("Missing detail view controller")
            }

            // Configure the SplitViewController to prefer to always
            // show both master and detail views.
        splitViewController.preferredDisplayMode = .oneBesideSecondary

            // Make the master view controller the delegate.
            splitViewController.delegate = masterViewController

            // Add the display mode button to the navigation bar
            // of the secondary view controller.
            detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            detailViewController.navigationItem.leftItemsSupplementBackButton = true
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

