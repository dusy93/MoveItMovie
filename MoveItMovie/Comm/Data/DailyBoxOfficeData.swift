//
//  DailyBoxOfficeData.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/18.
//

import Foundation

struct BoxOfficeData {
    public var rank: String = ""                // 순위
    public var rankOldAndNew: Int = 0           // 신규진입여부(OLD: 0, NEW: 1)
    public var movieCd: String = ""             // 영화 코드
    public var movieName: String = ""           // 영화명(국문)
    public var openDate: Date = Date()          // 개봉일
    public var totalAudienceCount: Int = 0      // 누적 관객 수
}
