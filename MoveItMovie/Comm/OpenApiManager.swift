//
//  OpenApiManager.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/16.
//

import Foundation
import Alamofire

fileprivate let API_KEY = "9bf4e66436423c24f21ca6b64068f1ba"

class OpenApiManager: NSObject {
    
    static let sharedInstance: OpenApiManager = {
        var instance = OpenApiManager()
        return instance
    }()
    
    override init() {
        super.init()
    }
    
    open func requestData(Params param: Parameters = [:],
                          ServiceMode serviceMode: ServiceMode = .Daily,
                          Completion completion: @escaping ((_ data: Data) -> Void),
                          FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        var parameter = param
        parameter.updateValue(API_KEY, forKey: "key")
        
        AF.request(getURLs(serviceMode), method: .get, parameters: parameter)
            .validate()
            .responseData(queue: .main, completionHandler: { response in
                switch response.result {
                case .success(_):
                    print("response success")
                    
                    guard let data = response.value else {
                        failError("data")
                        return
                    }
                    
                    completion(data)
                case .failure(let error):
                    print("response failure \(error)")
                    
                    failError("response")
                }
            })
    }
}

extension OpenApiManager {
    open func requestDailyBoxOfficeList(Params param: Parameters = [:],
                                        ServiceMode serviceMode: ServiceMode = .Daily,
                                        Completion completion: @escaping ((_ data: Data) -> Void),
                                        FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        OpenApiManager.sharedInstance.requestData(Params: param, ServiceMode: serviceMode, Completion: completion, FailError: failError)
    }
}
