//
//  ResponceCompanyList.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/21.
//

import Foundation

struct ResponceCompanyList: Codable {
    
    public var companyListResult: CompanyListResult
    
    enum CodingKeys: String, CodingKey {
        case companyListResult = "companyListResult"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyListResult = (try values.decode(CompanyListResult.self, forKey: .companyListResult))
    }
}

struct CompanyListResult: Codable {
    
    public var totCnt: Int
    public var companyList: [CompanyList]
    
    enum CodingKeys: String, CodingKey {
        case totCnt = "totCnt"
        case companyList = "companyList"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        totCnt = (try? values.decode(Int.self, forKey: .totCnt)) ?? 1
        companyList = (try? values.decode([CompanyList].self, forKey: .companyList)) ?? []
    }
}

struct CompanyList: Codable {
    
    public var companyCd: String                    // 영화사 코드
    public var companyNm: String                    // 영화사명
    public var companyNmEn: String                  // 영화사명(영문)
    public var companyPartNames: String             // 영화사 분류
    public var ceoNm: String                        // 대표자명
    public var filmoNames: String                   // 필모리스트
    
    enum CodingKeys: String, CodingKey {
        case companyCd = "companyCd"
        case companyNm = "companyNm"
        case companyNmEn = "companyNmEn"
        case companyPartNames = "companyPartNames"
        case ceoNm = "ceoNm"
        case filmoNames = "filmoNames"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyCd = (try? values.decode(String.self, forKey: .companyCd)) ?? ""
        companyNm = (try? values.decode(String.self, forKey: .companyNm)) ?? ""
        companyNmEn = (try? values.decode(String.self, forKey: .companyNmEn)) ?? ""
        companyPartNames = (try? values.decode(String.self, forKey: .companyPartNames)) ?? ""
        ceoNm = (try? values.decode(String.self, forKey: .ceoNm)) ?? ""
        filmoNames = (try? values.decode(String.self, forKey: .filmoNames)) ?? ""
    }
}
