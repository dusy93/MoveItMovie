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
        var param: Parameters = [:]
        param.updateValue(convertDateToString(date: yesterdayDate, format: "yyyyMMdd"), forKey: "targetDt")
        
        OpenApiManager.sharedInstance
            .requestDailyBoxOfficeList(Params: param, ServiceMode: .Daily) { data in
                do {
                    let dailyBoxOfficeData = try JSONDecoder().decode(ResponceDailyBoxOffice.self, from: data)
                    print(dailyBoxOfficeData.boxOfficeResult.dailyBoxOfficeList)
                } catch {
                    print(error)
                }
            } FailError: { errorCode in
                print("error \(errorCode)")
            }

    }
}

