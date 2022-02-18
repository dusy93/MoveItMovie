//
//  OpenApiService.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/15.
//

import Foundation
import Alamofire

fileprivate let KOBIS_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest%@.json"
let API_KEY = "9bf4e66436423c24f21ca6b64068f1ba"

public func getURLs(_ serviceMode: ServiceMode) -> String {
    
    switch serviceMode {
    case .Daily:
        return String(format: KOBIS_URL, ParamsConstant.DailyBoxOffice.rawValue)
    case .Weekly:
        return String(format: KOBIS_URL, ParamsConstant.WeeklyBoxOffice.rawValue)
    case .MovieList:
        return String(format: KOBIS_URL, ParamsConstant.MovieList.rawValue)
    case .MovieInfo:
        return String(format: KOBIS_URL, ParamsConstant.MovieInfo.rawValue)
    case .CompanyList:
        return String(format: KOBIS_URL, ParamsConstant.CompanyList.rawValue)
    case .CompanyInfo:
        return String(format: KOBIS_URL, ParamsConstant.CompanyInfo.rawValue)
    case .PeopleList:
        return String(format: KOBIS_URL, ParamsConstant.PeopleList.rawValue)
    case .PeopleInfo:
        return String(format: KOBIS_URL, ParamsConstant.PeopleInfo.rawValue)
    }
}

