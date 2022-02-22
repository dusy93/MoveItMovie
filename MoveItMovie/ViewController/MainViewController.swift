//
//  MainViewController.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import UIKit
import Alamofire

let MAIN = MainViewController.sharedInstance

class MainViewController: UIViewController {
    
    @IBOutlet weak var iv_topMovie: UIImageView?
    @IBOutlet weak var lb_topMovie: UILabel?
    @IBOutlet weak var lb_topMovieSub: UILabel?
    @IBOutlet weak var vi_topNew: UIView?
    @IBOutlet weak var cv_dailyRank: UICollectionView!
    
    var presenter: MainViewPresenter?
    
    static let sharedInstance: MainViewController = {
        var instance = MainViewController.init(nibName: "MainViewController", bundle: nil)
        return instance
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainViewPresenter.init(self)
        
        presenter?.initial()
        initialUI()
    }
    
    func initialUI() {
        lb_topMovieSub?.numberOfLines = 2
        
        iv_topMovie?.layer.masksToBounds = true
        iv_topMovie?.layer.borderWidth = 2
        iv_topMovie?.layer.borderColor = CommonUtils.getColor(key: .IMAGE_BORDER).cgColor
        iv_topMovie?.layer.cornerRadius = 5
        
        vi_topNew?.layer.borderWidth = 2
        vi_topNew?.layer.borderColor = CommonUtils.getColor(key: .IMAGE_BORDER).cgColor
        vi_topNew?.layer.cornerRadius = 5
        
        let dailyRankCollectionViewCell = UINib(nibName: "DailyRankCollectionViewCell", bundle: nil)
        cv_dailyRank.register(dailyRankCollectionViewCell, forCellWithReuseIdentifier: "dailyRankCollectionViewCell")
    }
    
    func setUI() {
        if let mainTopItem = presenter?.getMainTopItem() {
            lb_topMovie?.text = mainTopItem.movieName
            if mainTopItem.rankOldAndNew == 1 {
                vi_topNew?.isHidden = false
            }
        }
        cv_dailyRank.reloadData()
    }
    
    func setUIImage() {
        if let mainTopItem = presenter?.getMainTopItem() {
            if let subMovieItem = presenter?.getSubMovieItem(movieName: mainTopItem.movieName) {
                iv_topMovie?.loadImage(subMovieItem.imageName)
                if !subMovieItem.director.isEmpty || !subMovieItem.actor.isEmpty {
                    lb_topMovieSub?.text = "감독 : " + subMovieItem.director.replacingOccurrences(of: "|", with: "") + "\n배우 : " + subMovieItem.actor.replacingOccurrences(of: "|", with: ", ")
                } else {
                    lb_topMovieSub?.text = ""
                }
            }
        }
        cv_dailyRank.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.dailyData.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailyRankCollectionViewCell", for: indexPath) as! DailyRankCollectionViewCell
        
        cell.lb_rank.text = ""
        cell.iv_movie.image = UIImage()
        
        guard let item = presenter?.dailyData[indexPath.row], let subItem = presenter?.subMovieData[item.movieName] else {
            return cell
        }
        
        cell.lb_rank.text = "\(indexPath.row+1)"
        cell.iv_movie.loadImage(subItem.imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 200)
    }
}
