//
//  CommonUtils.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/16.
//

import Foundation

// 날짜 -> 문자
public func convertDateToString(date: Date, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    
    return dateFormatter.string(from: date)
}

// 문자 -> 날짜
public func convertStringToDate(dateString: String, format: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    
    if let tempDate = dateFormatter.date(from: dateString) {
        return tempDate
    }
    
    return Date()
}
