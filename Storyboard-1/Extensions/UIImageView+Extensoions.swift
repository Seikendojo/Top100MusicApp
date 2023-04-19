//
//  UIImageView+Extensoions.swift
//  Storyboard-1
//
//  Created by Seiken Dojo on 2023-03-21.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImage(from urlString: String?) {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            image = .defaultArtwork
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, erorr in
            DispatchQueue.main.async {
                guard erorr == nil,
                      let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200,
                      let mimeType = response?.mimeType,
                      mimeType.hasPrefix("image"),
                      let data = data,
                      let image = UIImage(data: data)
                else {
                    self.image = .defaultArtwork
                    return
                }
                self.image = image
            }
        }.resume()
        
    }
}

extension UIImage {
    static let defaultArtwork = UIImage(named: "artwork")
}
