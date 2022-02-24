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
    
    func requestData(Params param: Parameters = [:],
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
    
    open func requestWeeklyBoxOfficeList(Params param: Parameters = [:],
                                         ServiceMode serviceMode: ServiceMode = .Weekly,
                                         Completion completion: @escaping ((_ data: Data) -> Void),
                                         FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        OpenApiManager.sharedInstance.requestData(Params: param, ServiceMode: serviceMode, Completion: completion, FailError: failError)
    }
    
    open func requestCompanyList(Params param: Parameters = [:],
                                 ServiceMode serviceMode: ServiceMode = .CompanyList,
                                 Completion completion: @escaping ((_ data: Data) -> Void),
                                 FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        OpenApiManager.sharedInstance.requestData(Params: param, ServiceMode: serviceMode, Completion: completion, FailError: failError)
    }
    
    open func requestCompanyInfo(Params param: Parameters = [:],
                                 ServiceMode serviceMode: ServiceMode = .CompanyInfo,
                                 Completion completion: @escaping ((_ data: Data) -> Void),
                                 FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        OpenApiManager.sharedInstance.requestData(Params: param, ServiceMode: serviceMode, Completion: completion, FailError: failError)
    }
    
    open func requestMovieInfo(Params param: Parameters = [:],
                               ServiceMode serviceMode: ServiceMode = .MovieInfo,
                               Completion completion: @escaping ((_ data: Data) -> Void),
                               FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        OpenApiManager.sharedInstance.requestData(Params: param, ServiceMode: serviceMode, Completion: completion, FailError: failError)
    }
}
