//
//  SceneDelegate.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let splitViewController = window?.rootViewController as? UISplitViewController else {
            fatalError("Missing SplitViewController")
        }

        guard let splitMainNavController = splitViewController.viewControllers.first as? UINavigationController,
             let splitMainViewController = splitMainNavController.topViewController as? MoviesCollectionViewController
        else {
            fatalError("Missing MasterViewController")
        }

        guard let navigationController = splitViewController.viewControllers.last as? UINavigationController,
              let detailViewController = navigationController.topViewController
        else {
            fatalError("Missing detail view controller")
        }

        // Configure the SplitViewController to prefer to always
        // show both master and detail views.
        splitViewController.preferredDisplayMode = .oneBesideSecondary

        // Make the master view controller the delegate.
        splitViewController.delegate = splitMainViewController

        // Add the display mode button to the navigation bar
        // of the secondary view controller.
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene re-connect later, as its session was not necessarily discarded.
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
