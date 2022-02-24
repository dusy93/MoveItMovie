//
//  RequestWeeklyBoxOffice.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/24.
//

import Foundation

struct RequestWeeklyBoxOffice: Codable {
    
    public var key: String = API_KEY            // 발급받은키 값
    public var targetDt: String = ""            // 조회하고자 하는 날짜(yyyymmdd 형식)
    public var weekGb: String = "0"             // 주간/주말/주중을 선택 입력(“0” : 주간 (월~일), “1” : 주말 (금~일) (default), “2” : 주중 (월~목))
    public var itemPerPage: String = "10"       // 결과 ROW 의 개수(default : “10” / 최대 : “10“)
    public var multiMovieYn: String?            // 다양성 영화/상업영화를 구분(“Y” : 다양성 영화, “N” : 상업영화, default : 전체)
    public var repNationCd: String?             // 한국/외국 영화별로 조회(“K: : 한국영화, “F” : 외국영화, default : 전체)
    public var wideAreaCd: String?              // 상영지역별로 조회, 지역코드는 공통코드 조회 (default : 전체)
    
    public init() {}
}

