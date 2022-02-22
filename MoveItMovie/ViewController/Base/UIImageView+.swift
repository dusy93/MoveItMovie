//
//  UIImageView+.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/21.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(_ url: String) {
        let cacheKey = NSString(string: url)
        
        if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, err) in
            DispatchQueue.main.async {
                if let data = data , let image = UIImage(data: data){
                    ImageCacheManager.shared.setObject(image, forKey: cacheKey)

                    self.image = image
                }
            }
        }
        .resume()
    }
}

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init () {}
}
