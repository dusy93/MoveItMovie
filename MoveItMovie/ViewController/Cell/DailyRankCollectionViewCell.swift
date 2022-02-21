//
//  DailyRankCollectionViewCell.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/21.
//

import UIKit

class DailyRankCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lb_rank: UILabel!
    @IBOutlet weak var iv_movie: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iv_movie?.layer.masksToBounds = true
        iv_movie?.layer.borderWidth = 2
        iv_movie?.layer.borderColor = CommonUtils.getColor(key: .IMAGE_BORDER).cgColor
        iv_movie?.layer.cornerRadius = 5
    }

}
