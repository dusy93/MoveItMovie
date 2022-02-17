//
//  ParamsConstant.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/16.
//

import Foundation

public enum ServiceMode: String {
    case Daily
    case Weekly
    case MovieList
    case MovieInfo
    case CompanyList
    case CompanyInfo
    case PeopleList
    case PeopleInfo
}

public enum ParamsConstant: String {
    case DailyBoxOffice = "/boxoffice/searchDailyBoxOfficeList"
    case WeeklyBoxOffice = "/boxoffice/searchWeeklyBoxOfficeList"
    case MovieList = "/movie/searchMovieList"
    case MovieInfo = "/movie/searchMovieInfo"
    case CompanyList = "/company/searchCompanyList"
    case CompanyInfo = "/company/searchCompanyInfo"
    case PeopleList = "/people/searchPeopleList"
    case PeopleInfo = "/people/searchPeopleInfo"
}
