//
//  RequestDailyBoxOffice.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import Foundation

struct RequestDailyBoxOffice: Codable {
    
    public var key: String = API_KEY            // 발급받은키 값
    public var targetDt: String = ""            // 조회하고자 하는 날짜(yyyymmdd 형식)
    public var itemPerPage: String = "10"       // 결과 ROW 의 개수(default : “10” / 최대 : “10“)
    public var multiMovieYn: String?            // 다양성 영화/상업영화를 구분(“Y” : 다양성 영화, “N” : 상업영화, default : 전체)
    public var repNationCd: String?             // 한국/외국 영화별로 조회(“K: : 한국영화, “F” : 외국영화, default : 전체)
    public var wideAreaCd: String?              // 상영지역별로 조회, 지역코드는 공통코드 조회 (default : 전체)
    
    public init() {}
}
