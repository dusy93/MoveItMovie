//
//  CompanyRecommendCollectionViewCell.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/23.
//

import UIKit

class CompanyRecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iv_movie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iv_movie.addImageBorderColor()
    }

}
