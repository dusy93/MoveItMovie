//
//  OpenApiManager.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/16.
//

import Foundation
import Alamofire

class OpenApiManager: NSObject {
    
    static let sharedInstance: OpenApiManager = {
        var instance = OpenApiManager()
        return instance
    }()
    
    override init() {
        super.init()
    }
    
    open func requestData(Params param: Any? = nil,
                          ServiceMode serviceMode: ServiceMode = .Daily,
                          Completion completion: @escaping ((_ data: Data) -> Void),
                          FailError failError: @escaping (() -> Void)) {
        
        AF.request("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json", method: .get, parameters: param as? Parameters)
            .validate()
            .responseData(queue: .main, completionHandler: { response in
                switch response.result {
                case .success(_):
                    print("aaa")
                    guard let data = response.value else {
                        failError()
                        return
                    }
                    completion(data)
                case .failure(let error):
                    print("bbb \(error)")
                    failError()
                }
            })
        
    }
    
    open func requestDailyBoxOfficeList(Params param: Any? = nil,
                                        ServiceMode serviceMode: ServiceMode = .Daily,
                                        Completion completion: @escaping ((_ data: Data) -> Void),
                                        FailError failError: @escaping (() -> Void)) {
        
        OpenApiManager.sharedInstance.requestData(Params: param, ServiceMode: serviceMode, Completion: completion, FailError: failError)
    }
}
