//
//  RequestDailyBoxOffice.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import Foundation

struct RequestDailyBoxOffice: Codable {
    
    public var key: String = API_KEY
    public var targetDt: String = ""
    public var itemPerPage: String = "10"
    public var multiMovieYn: String?
    public var repNationCd: String?
    public var wideAreaCd: String?
    
    public init() {}
}
