//
//  RequestNaverSearchMovie.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/17.
//

import Foundation

struct RequestNaverSearchMovie: Codable {
    
    public var query: String = ""
    public var display: Int = 1
    public var start: Int?
    public var genre: String?
    public var country: String?
    public var yearfrom: Int?
    public var yearto: Int?
    
    public init() {}
}
