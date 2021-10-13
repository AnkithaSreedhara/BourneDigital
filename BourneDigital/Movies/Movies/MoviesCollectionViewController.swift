//
//  MoviesCollectionViewController.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import OpenCombine
import UIKit

protocol MoviesNavigationProtocol: AnyObject {
    func showMovieDetail(movie: Movie)
}

private let reuseIdentifier = "MoviesCollectionViewCell"

class MoviesCollectionViewController: UICollectionViewController {
    var viewModel: MoviesViewModel!
    private var bindings = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        viewModel = MoviesViewModel()
        setUpVM()
        setUpBindings()
    }

    func setUpVM() {
        viewModel.fetchMovies()
    }

    func setUpBindings() {
        viewModel.moviesRetrieved.sink(receiveCompletion: { _ in }, receiveValue: { [weak self] _ in
            guard let weakself = self else { return }
            DispatchQueue.main.async {
                weakself.collectionView.reloadData()
            }
        }).store(in: &bindings)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
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

    override func numberOfSections(in _: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        cell.

        return cell
    }

}

extension MoviesCollectionViewController: UISplitViewControllerDelegate {
    func splitViewController(_: UISplitViewController,
                             collapseSecondary _: UIViewController,
                             onto _: UIViewController) -> Bool {
        return true
    }
}
