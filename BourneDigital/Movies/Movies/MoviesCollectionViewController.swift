//
//  MoviesCollectionViewController.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import UIKit
import OpenCombine

protocol MoviesNavigationProtocol: AnyObject{
    func showMovieDetail(movie: Movie)
}
private let reuseIdentifier = "MoviesCollectionViewCell"

class MoviesCollectionViewController: UICollectionViewController {
    var viewModel: MoviesViewModel!
    private var bindings = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
                    self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.viewModel = MoviesViewModel.init()
        setUpVM()
        setUpBindings()
    }
    func setUpVM(){
        viewModel.fetchMovies()
    }
    func setUpBindings(){
        viewModel.moviesRetrieved.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] _ in
            guard let weakself = self else { return }
            DispatchQueue.main.async {
                weakself.collectionView.reloadData()
            }
        }).store(in: &bindings)
    }
    // MARK: - Navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             guard let navController = segue.destination as? UINavigationController,
                 let viewController = navController.topViewController as? MovieDetailViewController
             else {
                 fatalError("Expected DetailViewController")
             }

             viewController.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
             viewController.navigationItem.leftItemsSupplementBackButton = true
             viewController.detailItem = ""
         }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        cell.
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
extension MoviesCollectionViewController : UISplitViewControllerDelegate{
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
//
//        guard let navigationController = secondaryViewController
//        as? UINavigationController,
//        let detailViewController = navigationController.topViewController
//        as? MovieDetailViewController else {
//          // Fallback to the default
//          return false
//        }

        return true
        }
}
