//
//  RequestMovieInfo.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/22.
//

import Foundation

struct RequestMovieInfo: Codable {
    
    public var key: String = API_KEY            // 발급받은키 값
    public var movieCd: String = ""             // 영화코드
    
}
