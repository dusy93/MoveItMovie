//
//  RequestNaverSearchMovie.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import Foundation

struct RequestNaverSearchMovie: Codable {
    
    public var query: String = ""       // 검색 질의
    public var display: Int = 1         // 결과 출력 건수
    public var start: Int?              // 시작 위치 지정
    public var genre: String?           // 장르 코드
    public var country: String?         // 국가 코드
    public var yearfrom: Int?           // 영화의 제작년도(최소)
    public var yearto: Int?             // 영화의 제작년도(최대)
    
    public init() {}
}

// 장르 코드
// 1: 드라마 2: 판타지 3: 서부 4: 공포 5: 로맨스 6: 모험 7: 스릴러 8: 느와르 9: 컬트 10: 다큐멘터리 11: 코미디 12: 가족 13: 미스터리 14: 전쟁 15: 애니메이션 16: 범죄 17: 뮤지컬 18: SF 19: 액션20: 무협 21: 에로 22: 서스펜스 23: 서사 24: 블랙코미디 25: 실험 26: 영화카툰 27: 영화음악 28: 영화패러디포스터
// 국가 코드
// 한국 (KR), 일본 (JP), 미국 (US), 홍콩 (HK), 영국 (GB), 프랑스 (FR), 기타 (ETC)
