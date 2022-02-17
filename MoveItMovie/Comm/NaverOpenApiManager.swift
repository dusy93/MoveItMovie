//
//  NaverOpenApiManager.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import Foundation
import Alamofire

fileprivate let NAVER_URL = "https://openapi.naver.com/v1/search/movie.json"
fileprivate let X_NAVER_CLIENT_ID = "ysGFZpF0itO9mk2GDA4l"
fileprivate let X_NAVER_CLIENT_SECRET = "SYkxWH8yMZ"
fileprivate let NAVER_HEADER: HTTPHeaders = [
    "X-Naver-Client-Id": "\(X_NAVER_CLIENT_ID)",
    "X-Naver-Client-Secret": "\(X_NAVER_CLIENT_SECRET)",
]

class NaverOpenApiManager: NSObject {
    
    static let sharedInstance: NaverOpenApiManager = {
        var instance = NaverOpenApiManager()
        return instance
    }()
    
    override init() {
        super.init()
    }
    
    func requestData(Params param: Parameters = [:],
                     Completion completion: @escaping ((_ data: Data) -> Void),
                     FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        AF.request(NAVER_URL, method: .get, parameters: param, headers: NAVER_HEADER)
            .validate()
            .responseData(queue: .main, completionHandler: { response in
                switch response.result {
                case .success(_):
                    print("naver response success")
                    
                    guard let data = response.value else {
                        failError("data")
                        return
                    }
                    
                    completion(data)
                case .failure(let error):
                    print("naver response failure \(error)")
                    
                    failError("response")
                }
            })
    }
}

extension NaverOpenApiManager {
    open func requestNaverSearchMovie(Params param: Parameters = [:],
                                      Completion completion: @escaping ((_ data: Data) -> Void),
                                      FailError failError: @escaping ((_ errorCode: String) -> Void)) {
        
        NaverOpenApiManager.sharedInstance.requestData(Params: param, Completion: completion, FailError: failError)
    }
}
