//
//  MoviesCollectionViewController.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import UIKit

private let reuseIdentifier = "MoviesCollectionViewCell"

class MoviesCollectionViewController: UICollectionViewController,
                                    UICollectionViewDelegateFlowLayout,
                                    MoviesRespFetchProtocol {
    var viewModel: MoviesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        viewModel = MoviesViewModel(delegate: self)
        setUpVM()
    }

    func setUpVM() {
        viewModel.fetchMovies()
    }
    func moviesFetched() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navController = segue.destination as? UINavigationController,
              let viewController = navController.topViewController as? MovieDetailViewController,
              let cell = sender as? MoviesCollectionViewCell,
              let indexOfCell = collectionView.indexPath(for: cell)
        else {
            fatalError("Expected DetailViewController")
        }
        viewController.viewModel = MovieDetailViewModel(viewModel.moviesArray[indexOfCell.row])
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in _: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return viewModel.moviesArray.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as? MoviesCollectionViewCell
        cell?.resetData()
        cell?.movieTitleLabel.text = viewModel.moviesArray[indexPath.row].title
        ImageDownloadManager.shared.downloadImage(viewModel.moviesArray[indexPath.row].imageHref ?? "",
                                                  indexPath: indexPath) {(image, _, indexPathh, _) in
            if let indexPathNew = indexPathh, let imageNew = image {
                DispatchQueue.main.async {
                    if let getCell = collectionView.cellForItem(at: indexPathNew) {
                        (getCell as? MoviesCollectionViewCell)!.movieImageView.image = imageNew
                    }
                }
            }
        }
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isLandscape {
            return CGSize(width: collectionView.bounds.size.width/3 - 30,
                          height: collectionView.bounds.size.width/3 - 30)
            } else {
            return CGSize(width: collectionView.bounds.size.width/2 - 30,
                          height: collectionView.bounds.size.width/2 - 30)
        }
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        collectionView.reloadData()
    }
}

extension MoviesCollectionViewController: UISplitViewControllerDelegate {
    func splitViewController(_: UISplitViewController,
                             collapseSecondary _: UIViewController,
                             onto _: UIViewController) -> Bool {
        return true
    }
}
