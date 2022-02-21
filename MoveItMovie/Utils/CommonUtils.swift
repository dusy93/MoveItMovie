//
//  CommonUtils.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/16.
//

import Foundation
import UIKit


class CommonUtils {
    // 날짜 -> 문자
    class func convertDateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }

    // 문자 -> 날짜
    class func convertStringToDate(dateString: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if let tempDate = dateFormatter.date(from: dateString) {
            return tempDate
        }
        
        return Date()
    }

    class func LoadPlistFromMainBundle(fileName: String) -> NSMutableDictionary? {
        let FBundle:Bundle = Bundle(for: self)
        let pathReource = FBundle.path(forResource: fileName, ofType: "plist")
        
        let dictionaryFile:NSMutableDictionary? = NSMutableDictionary (contentsOfFile: pathReource!)
        return dictionaryFile
    }
    
    class func getHexColor(hex: String) -> UIColor {
        let r, g, b, a: CGFloat
        let hexColor = hex
        
        if hexColor.count == 8 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                a = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                r = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                b = CGFloat(hexNumber & 0x000000ff) / 255
                
                return UIColor(red: r, green: g, blue: b, alpha: a)
            }
        } else if hexColor.count == 6 {
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat((hexNumber & 0x0000ff) ) / 255
                
                return UIColor(red: r, green: g, blue: b, alpha: 1.0)
            }
        }
        
        return UIColor.white
    }

    class func getColor(key: ColorKey) -> UIColor {
        let bundleFileColorList: NSMutableDictionary = (CommonUtils.LoadPlistFromMainBundle(fileName: "ColorSet"))!
        
        let dictionaryColor: NSMutableDictionary = bundleFileColorList.object(forKey: "default") as! NSMutableDictionary
        let haxColor: String = dictionaryColor.object(forKey:key.rawValue) as! String
        
        let color:UIColor = CommonUtils.getHexColor(hex: haxColor)
        return color
    }
}
