//
//  AlbumDetailsViewController.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-24.
//

import UIKit

class AlbumDetailsViewController: UIViewController {

    //MARK: IBOutlets

    @IBOutlet weak var openALbumButton: UIButton!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    //MARK: Properties
    
    var album: Album?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: Helpers

    private func updateUI() {
        if let album = album {
            albumImageView.applyDropShadowStyle(offset: CGSize(width: 2.0, height: 2.0), opacity: 0.5, radius: 5.0)
            albumImageView.loadImage(from: album.artworkUrl100)
            albumNameLabel.text = album.name
            artistNameLabel.text = album.artistName
            releasedLabel.text = album.releaseDate
            genreLabel.text = album.genres[0].name
            openALbumButton.makeButtonRounded()
        }
    }
    
    //MARK: IBActions

    @IBAction func openAlbumInAppleMusicTapped(_ sender: UIButton) {
        guard let url = URL(string: album!.url),
              UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
