//
//  ViewController.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/15.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        var param = ["key": "9bf4e66436423c24f21ca6b64068f1ba", "targetDt": "20220216"] as Dictionary
        param.updateValue(convertDateToString(date: yesterdayDate, format: "yyyyMMdd"), forKey: "targetDt")
        
        OpenApiManager.sharedInstance
            .requestDailyBoxOfficeList(Params: param, ServiceMode: .Daily) { data in
                let encodingData = String(data: data, encoding: .utf8)
                print("data : \(String(describing: encodingData))")
            } FailError: {
                print("error")
            }

    }
}

