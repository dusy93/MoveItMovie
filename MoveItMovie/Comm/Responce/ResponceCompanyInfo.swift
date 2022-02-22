//
//  ResponceCompanyInfo.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/22.
//

import Foundation

struct ResponceCompanyInfo: Codable {
    
    public var companyInfoResult: CompanyInfoResult
    
    enum CodingKeys: String, CodingKey {
        case companyInfoResult = "companyInfoResult"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyInfoResult = (try values.decode(CompanyInfoResult.self, forKey: .companyInfoResult))
    }
}

struct CompanyInfoResult: Codable {
    
    public var companyInfo: [CompanyInfo]
    public var source: String
    
    enum CodingKeys: String, CodingKey {
        case companyInfo = "companyInfo"
        case source = "source"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyInfo = (try? values.decode([CompanyInfo].self, forKey: .companyInfo)) ?? []
        source = (try? values.decode(String.self, forKey: .source)) ?? ""
    }
}

struct CompanyInfo: Codable {
    
    public var companyCd: String                    // 영화사 코드
    public var companyNm: String                    // 영화사명
    public var companyNmEn: String                  // 영화사명(영문)
    public var ceoNm: String                        // 대표자명
    public var parts: [CompanyInfoParts]            // 영화사 분류
    public var filmos: [CompanyInfoFilmos]          // 영화사 필모
    
    enum CodingKeys: String, CodingKey {
        case companyCd = "companyCd"
        case companyNm = "companyNm"
        case companyNmEn = "companyNmEn"
        case ceoNm = "ceoNm"
        case parts = "parts"
        case filmos = "filmos"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyCd = (try? values.decode(String.self, forKey: .companyCd)) ?? ""
        companyNm = (try? values.decode(String.self, forKey: .companyNm)) ?? ""
        companyNmEn = (try? values.decode(String.self, forKey: .companyNmEn)) ?? ""
        ceoNm = (try? values.decode(String.self, forKey: .ceoNm)) ?? ""
        parts = (try? values.decode([CompanyInfoParts].self, forKey: .parts)) ?? []
        filmos = (try? values.decode([CompanyInfoFilmos].self, forKey: .filmos)) ?? []
    }
}

struct CompanyInfoParts: Codable {
    
    public var companyPartNm: String            // 영화사 분류명
    
    enum CodingKeys: String, CodingKey {
        case companyPartNm = "companyPartNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyPartNm = (try? values.decode(String.self, forKey: .companyPartNm)) ?? ""
    }
}

struct CompanyInfoFilmos: Codable {
    
    public var movieCd: String              // 영화코드
    public var movieNm: String              // 영화명
    public var companyPartNm: String        // 영화사 참여 분류명
    
    enum CodingKeys: String, CodingKey {
        case movieCd = "movieCd"
        case movieNm = "movieNm"
        case companyPartNm = "companyPartNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        movieCd = (try? values.decode(String.self, forKey: .movieCd)) ?? ""
        movieNm = (try? values.decode(String.self, forKey: .movieNm)) ?? ""
        companyPartNm = (try? values.decode(String.self, forKey: .companyPartNm)) ?? ""
    }
}
