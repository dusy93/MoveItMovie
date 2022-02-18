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
    
    @IBOutlet var iv_topMovie: UIImageView?
    @IBOutlet var lb_topMovie: UILabel?
    @IBOutlet var vi_topNew: UIView?
    
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
        iv_topMovie?.layer.masksToBounds = true
        iv_topMovie?.layer.borderWidth = 1.5
        iv_topMovie?.layer.borderColor = UIColor.white.cgColor
        iv_topMovie?.layer.cornerRadius = 5
        
        vi_topNew?.layer.borderWidth = 1.5
        vi_topNew?.layer.borderColor = UIColor.white.cgColor
        vi_topNew?.layer.cornerRadius = 5
    }
    
    func setUI() {
        if let mainTopItem = presenter?.getMainTopItem() {
            lb_topMovie?.text = mainTopItem.movieName
            if mainTopItem.rankOldAndNew == 1 {
                vi_topNew?.isHidden = false
            }
        }
    }
    
    func setUIImage() {
        if let mainTopItem = presenter?.getMainTopItem() {
            if let subMovieItem = presenter?.getSubMovieItem(movieName: mainTopItem.movieName) {
                iv_topMovie?.image = getDownloadImage(imageURL: subMovieItem.imageName)
            }
        }
    }
    
    func getDownloadImage(imageURL: String) -> UIImage {
        do {
            if let url = URL(string: imageURL) {
                let data = try Data(contentsOf: url)
                
                if let uiImage = UIImage(data: data) {
                    return uiImage
                }
            }
            return UIImage()
        } catch {
            print("image error")
            return UIImage()
        }
    }
}
