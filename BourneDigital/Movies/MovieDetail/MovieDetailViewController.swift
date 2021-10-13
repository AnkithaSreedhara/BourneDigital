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
    var detailItem = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
