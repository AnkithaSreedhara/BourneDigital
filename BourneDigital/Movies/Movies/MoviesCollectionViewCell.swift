//
//  MoviesCollectionViewCell.swift
//  BourneDigital
//
//  Created by Sai Ankitha on 28/9/21.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func resetData(){
        self.movieImageView.image = UIImage()
        self.movieTitleLabel.text = ""
    }
}
