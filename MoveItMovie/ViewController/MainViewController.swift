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
    
    @IBOutlet weak var vi_intro: UIView?
    @IBOutlet weak var lb_intro: UILabel?
    
    @IBOutlet weak var vi_topMovieImage: UIView?
    @IBOutlet weak var iv_topMovie: UIImageView?
    @IBOutlet weak var lb_topMovie: UILabel?
    @IBOutlet weak var lb_topMovieSub: UILabel?
    @IBOutlet weak var vi_topNew: UIView?
    @IBOutlet weak var cv_dailyRank: UICollectionView!
    @IBOutlet weak var cv_companyRecommend: UICollectionView!
    
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
        vi_intro?.isHidden = false
        lb_intro?.text = "Move it!\nMovie!"
        lb_intro?.textAlignment = .center
        
        lb_topMovieSub?.numberOfLines = 2
        
        vi_topMovieImage?.addShadowColor()
        vi_topMovieImage?.layer.cornerRadius = 5
        iv_topMovie?.addImageBorderColor()
        vi_topNew?.addImageBorderColor()
        
        let dailyRankCollectionViewCell = UINib(nibName: "DailyRankCollectionViewCell", bundle: nil)
        cv_dailyRank.register(dailyRankCollectionViewCell, forCellWithReuseIdentifier: "dailyRankCollectionViewCell")
        cv_dailyRank.backgroundColor = CommonUtils.getColor(key: .BACKGROUND)
        
        let companyRecommendCollectionViewCell = UINib(nibName: "CompanyRecommendCollectionViewCell", bundle: nil)
        cv_companyRecommend.register(companyRecommendCollectionViewCell, forCellWithReuseIdentifier: "companyRecommendCollectionViewCell")
        cv_companyRecommend.backgroundColor = CommonUtils.getColor(key: .BACKGROUND)
    }
    
    func setUI() {
        if let mainTopItem = presenter?.getMainTopItem() {
            lb_topMovie?.text = mainTopItem.movieName
            if mainTopItem.rankOldAndNew == 1 {
                vi_topNew?.isHidden = false
            }
        }
        
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
        cv_companyRecommend.reloadData()
        vi_intro?.isHidden = true
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cv_dailyRank {
            return presenter?.dailyData.count ?? 0
        } else if collectionView == cv_companyRecommend {
            return presenter?.companyRecommendData.count ?? 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == cv_dailyRank {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dailyRankCollectionViewCell", for: indexPath) as! DailyRankCollectionViewCell
            
            cell.lb_rank.text = ""
            cell.iv_movie.image = UIImage()
            
            guard let item = presenter?.dailyData[indexPath.row], let subItem = presenter?.subMovieData[item.movieName] else {
                return cell
            }
            
            cell.lb_rank.text = "\(indexPath.row+1)"
            cell.iv_movie.loadImage(subItem.imageName)
            
            return cell
        } else if collectionView == cv_companyRecommend {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "companyRecommendCollectionViewCell", for: indexPath) as! CompanyRecommendCollectionViewCell
            
            cell.iv_movie.image = UIImage()
            
            guard let item = presenter?.companyRecommendData[indexPath.row], let subItem = presenter?.subMovieData[item.movieName] else {
                return cell
            }
            
            cell.iv_movie.loadImage(subItem.imageName)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cv_dailyRank {
            return CGSize(width: 175, height: 200)
        } else if collectionView == cv_companyRecommend {
            return CGSize(width: 120, height: 150)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == cv_companyRecommend {
            return 10
        } else {
            return 5
        }
    }
}
