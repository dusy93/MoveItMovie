//
//  RequestCompanyInfo.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/22.
//

import Foundation

struct RequestCompanyInfo: Codable {
    
    public var key: String = API_KEY            // 발급받은키 값
    public var companyCd: String = ""           // 영화사코드
    
}
