//
//  AlbumCell.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-20.
//

import UIKit

class AlbumCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    //MARK: Properties
    let cgSize = CGSize(width: 2.0, height: 2.0)

    func setupCell(album: Album) {
        albumNameLabel.text = album.name
        artistNameLabel.text = album.artistName
        artworkImageView.loadImage(from: album.artworkUrl100)
        //configuerShadow()
        artworkImageView.applyDropShadowStyle(offset: CGSize(width: 2.0, height: 2.0), opacity: 0.5, radius: 5.0)
    }
}
