//
//  ResponceNaverSearchMovie.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/18.
//

import Foundation

struct ResponceNaverSearchMovie: Codable {
    
    public var lastBuildDate: String            // 검색 결과를 생성한 시간
    public var total: Int                       // 검색의 전체
    public var start: Int                       // 검색의 시작 위치
    public var display: Int                     // 검색 결과 출력 건수
    public var items: [NaverSerachMovieItems]
    
    enum CodingKeys: String, CodingKey {
        case lastBuildDate = "lastBuildDate"
        case total = "total"
        case start = "start"
        case display = "display"
        case items = "items"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        lastBuildDate = (try? values.decode(String.self, forKey: .lastBuildDate)) ?? ""
        total = (try? values.decode(Int.self, forKey: .total)) ?? 1
        start = (try? values.decode(Int.self, forKey: .start)) ?? 1
        display = (try? values.decode(Int.self, forKey: .display)) ?? 1
        items = (try? values.decode([NaverSerachMovieItems].self, forKey: .items)) ?? []
    }
}

struct NaverSerachMovieItems: Codable {
    
    public var title: String            // 제목
    public var link: String             // 하이퍼텍스트
    public var image: String            // 썸네일 이미지의 URL
    public var subtitle: String         // 영문 제목
    public var pubDate: String          // 제작년도
    public var director: String         // 감독
    public var actor: String            // 배우
    public var userRating: String       // 유저들의 평점
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case link = "link"
        case image = "image"
        case subtitle = "subtitle"
        case pubDate = "pubDate"
        case director = "director"
        case actor = "actor"
        case userRating = "userRating"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        link = (try? values.decode(String.self, forKey: .link)) ?? ""
        image = (try? values.decode(String.self, forKey: .image)) ?? ""
        subtitle = (try? values.decode(String.self, forKey: .subtitle)) ?? ""
        pubDate = (try? values.decode(String.self, forKey: .pubDate)) ?? ""
        director = (try? values.decode(String.self, forKey: .director)) ?? ""
        actor = (try? values.decode(String.self, forKey: .actor)) ?? ""
        userRating = (try? values.decode(String.self, forKey: .userRating)) ?? ""
    }
}
