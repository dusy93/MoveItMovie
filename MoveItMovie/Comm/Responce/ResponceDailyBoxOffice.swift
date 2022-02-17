//
//  ResponceDailyBoxOffice.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import Foundation

struct ResponceDailyBoxOffice: Codable {
    
    public var boxOfficeResult: BoxOfficeResult
    
    enum CodingKeys: String, CodingKey {
        case boxOfficeResult = "boxOfficeResult"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        boxOfficeResult = (try values.decode(BoxOfficeResult.self, forKey: .boxOfficeResult))
    }
}

struct BoxOfficeResult: Codable {
    
    public var boxofficeType: String                       // 박스오피스 종류
    public var showRange: String                           // 박스오피스 조회 일자
    public var dailyBoxOfficeList: [DailyBoxOfficeList]
    
    enum CodingKeys: String, CodingKey {
        case boxofficeType = "boxofficeType"
        case showRange = "showRange"
        case dailyBoxOfficeList = "dailyBoxOfficeList"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        boxofficeType = (try? values.decode(String.self, forKey: .boxofficeType)) ?? ""
        showRange = (try? values.decode(String.self, forKey: .showRange)) ?? ""
        dailyBoxOfficeList = (try? values.decode([DailyBoxOfficeList].self, forKey: .dailyBoxOfficeList)) ?? []
    }
}

struct DailyBoxOfficeList: Codable {
    
    public var rnum: String                 // 순번
    public var rank: String                 // 해당일자의 박스오피스 순위
    public var rankInten: String            // 전일대비 순위의 증감분
    public var rankOldAndNew: String        // 랭킹에 신규진입여부(OLD: 기존, NEW: 신규)
    public var movieCd: String              // 영화의 대표코드
    public var movieNm: String              // 영화명(국문)
    public var openDt: String               // 영화의 개봉일
    public var salesAmt: String             // 해당일의 매출액
    public var salesShare: String           // 해당일자 상영작의 매출총액 대비 해당 영화의 매출비율
    public var salesInten: String           // 전일 대비 매출액 증감분
    public var salesChange: String          // 전일 대비 매출액 증감 비율
    public var salesAcc: String             // 누적매출액
    public var audiCnt: String              // 해당일의 관객수
    public var audiInten: String            // 전일 대비 관객수 증감분
    public var audiChange: String           // 전일 대비 관객수 증감 비율
    public var audiAcc: String              // 누적관객수
    public var scrnCnt: String              // 해당일자에 상영한 스크린수
    public var showCnt: String              // 해당일자에 상영된 횟수
    
    enum CodingKeys: String, CodingKey {
        case rnum = "rnum"
        case rank = "rank"
        case rankInten = "rankInten"
        case rankOldAndNew = "rankOldAndNew"
        case movieCd = "movieCd"
        case movieNm = "movieNm"
        case openDt = "openDt"
        case salesAmt = "salesAmt"
        case salesShare = "salesShare"
        case salesInten = "salesInten"
        case salesChange = "salesChange"
        case salesAcc = "salesAcc"
        case audiCnt = "audiCnt"
        case audiInten = "audiInten"
        case audiChange = "audiChange"
        case audiAcc = "audiAcc"
        case scrnCnt = "scrnCnt"
        case showCnt = "showCnt"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        rnum = (try? values.decode(String.self, forKey: .rnum)) ?? ""
        rank = (try? values.decode(String.self, forKey: .rank)) ?? ""
        rankInten = (try? values.decode(String.self, forKey: .rankInten)) ?? ""
        rankOldAndNew = (try? values.decode(String.self, forKey: .rankOldAndNew)) ?? ""
        movieCd = (try? values.decode(String.self, forKey: .movieCd)) ?? ""
        movieNm = (try? values.decode(String.self, forKey: .movieNm)) ?? ""
        openDt = (try? values.decode(String.self, forKey: .openDt)) ?? ""
        salesAmt = (try? values.decode(String.self, forKey: .salesAmt)) ?? ""
        salesShare = (try? values.decode(String.self, forKey: .salesShare)) ?? ""
        salesInten = (try? values.decode(String.self, forKey: .salesInten)) ?? ""
        salesChange = (try? values.decode(String.self, forKey: .salesChange)) ?? ""
        salesAcc = (try? values.decode(String.self, forKey: .salesAcc)) ?? ""
        audiCnt = (try? values.decode(String.self, forKey: .audiCnt)) ?? ""
        audiInten = (try? values.decode(String.self, forKey: .audiInten)) ?? ""
        audiChange = (try? values.decode(String.self, forKey: .audiChange)) ?? ""
        audiAcc = (try? values.decode(String.self, forKey: .audiAcc)) ?? ""
        scrnCnt = (try? values.decode(String.self, forKey: .scrnCnt)) ?? ""
        showCnt = (try? values.decode(String.self, forKey: .showCnt)) ?? ""
    }
}
