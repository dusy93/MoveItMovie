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
        
        var parameter: RequestDailyBoxOffice = RequestDailyBoxOffice()
        parameter.targetDt = CommonUtils.convertDateToString(date: yesterdayDate, format: "yyyyMMdd")
        parameter.itemPerPage = "1"
        
        do {
            let jsonEncoder = JSONEncoder()
            let encodingParam = try jsonEncoder.encode(parameter)
            let jsonParam = try JSONSerialization.jsonObject(with: encodingParam, options: .allowFragments)
            
            guard let param = jsonParam as? Parameters else {
                print("parameter error")
                return
            }
            
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
        } catch {
            print("error")
        }
    }
}

