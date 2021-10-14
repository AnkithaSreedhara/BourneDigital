//
//  MovieDetailViewController.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    var viewModel: MovieDetailViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUIValues()
    }
    func setUIValues() {
        DispatchQueue.main.async { [weak self] in
            self?.movieTitleLabel.text = self?.viewModel?.movie?.title
            self?.releaseDateLabel.text = self?.viewModel?.movie?.releaseDate
            self?.ratingLabel.text = "\(self?.viewModel?.movie?.rating ?? 0)"
        }
        ImageDownloadManager.shared.downloadImage(viewModel?.movie?.imageHref ?? "",
                                                  indexPath: nil) {(image, _, _, _) in
                DispatchQueue.main.async {
                    self.movieImageView.image = image
                    }        }
    }
}
