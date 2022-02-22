//
//  ResponcceMovieInfo.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/22.
//

import Foundation

struct ResponcceMovieInfo: Codable {
    
    public var movieInfoResult: MovieInfoResult
    
    enum CodingKeys: String, CodingKey {
        case movieInfoResult = "movieInfoResult"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        movieInfoResult = (try values.decode(MovieInfoResult.self, forKey: .movieInfoResult))
    }
}

struct MovieInfoResult: Codable {
    
    public var movieInfo: [MovieInfo]
    public var source: String
    
    enum CodingKeys: String, CodingKey {
        case movieInfo = "movieInfo"
        case source = "source"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        movieInfo = (try? values.decode([MovieInfo].self, forKey: .movieInfo)) ?? []
        source = (try? values.decode(String.self, forKey: .source)) ?? ""
    }
}

struct MovieInfo: Codable {
    
    public var movieCd: String                          // 영화코드
    public var movieNm: String                          // 영화명(국문)
    public var movieNmEn: String                        // 영화명(영문)
    public var movieNmOg: String                        // 영화명(원문)
    public var showTm: String                           // 상영시간
    public var prdtYear: String                         // 제작연도
    public var openDt: String                           // 개봉연도
    public var prdtStatNm: String                       // 제작상태명
    public var typeNm: String                           // 영화유형명
    public var nations: [MovieInfoNations]              // 제작국가
    public var genres: [MovieInfoGenres]                // 장르
    public var directors: [MovieInfoDirectors]          // 감독
    public var actors: [MovieInfoActors]                // 배우
    public var showTypes: [MovieInfoShowTypes]          // 상영형태 구분
    public var companys: [MovieInfoCompanys]            // 참여 영화사
    public var audits: [MovieInfoAudits]                // 심의정보
    public var staffs: [MovieInfoStaffs]                // 스텝
    
    enum CodingKeys: String, CodingKey {
        case movieCd = "movieCd"
        case movieNm = "movieNm"
        case movieNmEn = "movieNmEn"
        case movieNmOg = "movieNmOg"
        case showTm = "showTm"
        case prdtYear = "prdtYear"
        case openDt = "openDt"
        case prdtStatNm = "prdtStatNm"
        case typeNm = "typeNm"
        case nations = "nations"
        case genres = "genres"
        case directors = "directors"
        case actors = "actors"
        case showTypes = "showTypes"
        case companys = "companys"
        case audits = "audits"
        case staffs = "staffs"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        movieCd = (try? values.decode(String.self, forKey: .movieCd)) ?? ""
        movieNm = (try? values.decode(String.self, forKey: .movieNm)) ?? ""
        movieNmEn = (try? values.decode(String.self, forKey: .movieNmEn)) ?? ""
        movieNmOg = (try? values.decode(String.self, forKey: .movieNmOg)) ?? ""
        showTm = (try? values.decode(String.self, forKey: .showTm)) ?? ""
        prdtYear = (try? values.decode(String.self, forKey: .prdtYear)) ?? ""
        openDt = (try? values.decode(String.self, forKey: .openDt)) ?? ""
        prdtStatNm = (try? values.decode(String.self, forKey: .prdtStatNm)) ?? ""
        typeNm = (try? values.decode(String.self, forKey: .typeNm)) ?? ""
        nations = (try? values.decode([MovieInfoNations].self, forKey: .nations)) ?? []
        genres = (try? values.decode([MovieInfoGenres].self, forKey: .genres)) ?? []
        directors = (try? values.decode([MovieInfoDirectors].self, forKey: .directors)) ?? []
        actors = (try? values.decode([MovieInfoActors].self, forKey: .actors)) ?? []
        showTypes = (try? values.decode([MovieInfoShowTypes].self, forKey: .showTypes)) ?? []
        companys = (try? values.decode([MovieInfoCompanys].self, forKey: .companys)) ?? []
        audits = (try? values.decode([MovieInfoAudits].self, forKey: .audits)) ?? []
        staffs = (try? values.decode([MovieInfoStaffs].self, forKey: .staffs)) ?? []
    }
}

struct MovieInfoNations: Codable {
    
    public var nationNm: String                    // 제작국가명
    
    enum CodingKeys: String, CodingKey {
        case nationNm = "nationNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        nationNm = (try? values.decode(String.self, forKey: .nationNm)) ?? ""
    }
}

struct MovieInfoGenres: Codable {
    
    public var genreNm: String                  // 장르명
    
    enum CodingKeys: String, CodingKey {
        case genreNm = "genreNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        genreNm = (try? values.decode(String.self, forKey: .genreNm)) ?? ""
    }
}

struct MovieInfoDirectors: Codable {
    
    public var peopleNm: String                     // 감독명
    public var peopleNmEn: String                   // 감독명(영문)
    
    enum CodingKeys: String, CodingKey {
        case peopleNm = "peopleNm"
        case peopleNmEn = "peopleNmEn"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        peopleNm = (try? values.decode(String.self, forKey: .peopleNm)) ?? ""
        peopleNmEn = (try? values.decode(String.self, forKey: .peopleNmEn)) ?? ""
    }
}

struct MovieInfoActors: Codable {
    
    public var peopleNm: String                 // 배우명
    public var peopleNmEn: String               // 배우명(영문)
    public var cast: String                     // 배역명
    public var castEn: String                   // 배역명(영문)
    
    enum CodingKeys: String, CodingKey {
        case peopleNm = "peopleNm"
        case peopleNmEn = "peopleNmEn"
        case cast = "cast"
        case castEn = "castEn"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        peopleNm = (try? values.decode(String.self, forKey: .peopleNm)) ?? ""
        peopleNmEn = (try? values.decode(String.self, forKey: .peopleNmEn)) ?? ""
        cast = (try? values.decode(String.self, forKey: .cast)) ?? ""
        castEn = (try? values.decode(String.self, forKey: .castEn)) ?? ""
    }
}

struct MovieInfoShowTypes: Codable {
    
    public var showTypeGroupNm: String              // 상영형태 구분
    public var showTypeNm: String                   // 상영형태명
    
    enum CodingKeys: String, CodingKey {
        case showTypeGroupNm = "showTypeGroupNm"
        case showTypeNm = "nationNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        showTypeGroupNm = (try? values.decode(String.self, forKey: .showTypeGroupNm)) ?? ""
        showTypeNm = (try? values.decode(String.self, forKey: .showTypeNm)) ?? ""
    }
}

struct MovieInfoCompanys: Codable {
    
    public var companyCd: String                    // 참여 영화사 코드
    public var companyNm: String                    // 참여 영화사명
    public var companyNmEn: String                  // 참여 영화사명(영문)
    public var companyPartNm: String                // 참여 영화사 분야명
    
    enum CodingKeys: String, CodingKey {
        case companyCd = "companyCd"
        case companyNm = "companyNm"
        case companyNmEn = "companyNmEn"
        case companyPartNm = "companyPartNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        companyCd = (try? values.decode(String.self, forKey: .companyCd)) ?? ""
        companyNm = (try? values.decode(String.self, forKey: .companyNm)) ?? ""
        companyNmEn = (try? values.decode(String.self, forKey: .companyNmEn)) ?? ""
        companyPartNm = (try? values.decode(String.self, forKey: .companyPartNm)) ?? ""
    }
}

struct MovieInfoAudits: Codable {
    
    public var auditNo: String                  // 심의번호
    public var watchGradeNm: String             // 관람등급 명칭
    
    enum CodingKeys: String, CodingKey {
        case auditNo = "auditNo"
        case watchGradeNm = "watchGradeNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        auditNo = (try? values.decode(String.self, forKey: .auditNo)) ?? ""
        watchGradeNm = (try? values.decode(String.self, forKey: .watchGradeNm)) ?? ""
    }
}

struct MovieInfoStaffs: Codable {
    
    public var peopleNm: String                     // 스텝명
    public var peopleNmEn: String                   // 스텝명(영문)
    public var staffRoleNm: String                  // 스텝역할명
    
    enum CodingKeys: String, CodingKey {
        case peopleNm = "peopleNm"
        case peopleNmEn = "peopleNmEn"
        case staffRoleNm = "staffRoleNm"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        peopleNm = (try? values.decode(String.self, forKey: .peopleNm)) ?? ""
        peopleNmEn = (try? values.decode(String.self, forKey: .peopleNmEn)) ?? ""
        staffRoleNm = (try? values.decode(String.self, forKey: .staffRoleNm)) ?? ""
    }
}
