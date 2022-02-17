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
    
    static let sharedInstance: MainViewController = {
        var instance = MainViewController.init(nibName: "MainViewController", bundle: nil)
        return instance
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var parameter: RequestNaverSearchMovie = RequestNaverSearchMovie()
        parameter.query = "언차티드"
        
        do {
            let jsonEncoder = JSONEncoder()
            let encodingParam = try jsonEncoder.encode(parameter)
            let jsonParam = try JSONSerialization.jsonObject(with: encodingParam, options: .allowFragments)
            
            guard let param = jsonParam as? Parameters else {
                print("parameter error")
                return
            }
            
            NaverOpenApiManager.sharedInstance
                .requestNaverSearchMovie(Params: param, Completion: { data in
                    let encodingData = String(data: data, encoding: .utf8)
                    
                    print("data : \(String(describing: encodingData))")
                }, FailError: { errorCode in
                    print("error \(errorCode)")
                })
        } catch {
            print("error")
        }
    }
    
}
