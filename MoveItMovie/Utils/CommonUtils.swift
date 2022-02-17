//
//  CommonUtils.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/16.
//

import Foundation

public func convertDateToString(date: Date, format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    
    return dateFormatter.string(from: date)
}
