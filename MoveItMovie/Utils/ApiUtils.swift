//
//  ApiUtils.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/18.
//

import Foundation
import Alamofire


public func getParameterJson<ParamCodable: Encodable>(parameter: ParamCodable) -> Parameters? {
    var jsonParam: Any?
    
    let jsonEncoder = JSONEncoder()
    do {
        let encodingParam = try jsonEncoder.encode(parameter)
        jsonParam = try JSONSerialization.jsonObject(with: encodingParam, options: .allowFragments)
    } catch {
        print("parameter json error")
        return nil
    }
    
    guard let param = jsonParam as? Parameters else {
        print("parameter error")
        return nil
    }
    
    return param
}
