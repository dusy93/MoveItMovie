//
//   MainViewPresenter.swift
//  MoveItMovie
//
//  Created by YEON HWANGBO on 2022/02/18.
//

import Foundation
import Alamofire

class  MainViewPresenter {
    
    unowned let viewController: MainViewController
    
    var dailyData: [DailyBoxOfficeData] = []
    var subMovieData: [String:NaverSearchMovieData] = [:]
    let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
    
    init(_ view: MainViewController) {
        viewController = view
    }
    
    func initial() -> Void {
        requestDailyData()
        requestCompanyListData()
        requestCompanyInfoData("20173221") // 소니
        requestMovieInfoData("20210028") // 스파이더맨
    }
    
    // MARK: *FUNCTION*
    func getMainTopItem() -> DailyBoxOfficeData? {
        if let item = dailyData.first {
            return item
        }
        
        return nil
    }
    
    func getSubMovieItem(movieName: String) -> NaverSearchMovieData? {
        if let item = subMovieData[movieName] {
            return item
        }
        
        return nil
    }
    
    // MARK: *SET DATA*
    func setDailyData(data: [DailyBoxOfficeList]) {
        if data.count > 0 {
            var tempDailyData: [DailyBoxOfficeData] = []
            
            for item in data {
                var tempItem: DailyBoxOfficeData = DailyBoxOfficeData()
                
                requestNaverSearchMovieData(movieName: item.movieNm)
                
                tempItem.rank = item.rank
                if item.rankOldAndNew == "NEW" {
                    tempItem.rankOldAndNew = 1
                }
                tempItem.movieCd = item.movieCd
                tempItem.movieName = item.movieNm
                tempItem.openDate = CommonUtils.convertStringToDate(dateString: item.openDt, format: "yyyy-MM-dd")
                tempItem.totalAudienceCount = Int(item.audiAcc) ?? 0
                
                tempDailyData.append(tempItem)
            }
            
            dailyData.removeAll()
            dailyData = tempDailyData.sorted(by: {$0.rank < $1.rank})
            
            viewController.setUI()
        }
    }
    
    // MARK: *REQUEST*
    func requestDailyData() {
        
        var parameter: RequestDailyBoxOffice = RequestDailyBoxOffice()
        parameter.targetDt = CommonUtils.convertDateToString(date: yesterdayDate, format: "yyyyMMdd")
        
        if let param = getParameterJson(parameter: parameter) {
            OpenApiManager.sharedInstance
                .requestDailyBoxOfficeList(Params: param, ServiceMode: .Daily) { data in
                    do {
                        let dailyBoxOfficeData = try JSONDecoder().decode(ResponceDailyBoxOffice.self, from: data)
                        print(dailyBoxOfficeData.boxOfficeResult.dailyBoxOfficeList)
                        
                        self.setDailyData(data: dailyBoxOfficeData.boxOfficeResult.dailyBoxOfficeList)
                    } catch {
                        print(error)
                    }
                } FailError: { errorCode in
                    print("OpenApiManager error \(errorCode)")
                }
        } else {
            print("OpenApiManager param error")
        }
    }
    
    func requestCompanyListData() {
        
        OpenApiManager.sharedInstance
            .requestCompanyList(ServiceMode: .CompanyList) { data in
                do {
                    let companyListData = try JSONDecoder().decode(ResponceCompanyList.self, from: data)
                    print(companyListData.companyListResult)
                    
                } catch {
                    print(error)
                }
            } FailError: { errorCode in
                print("OpenApiManager error \(errorCode)")
            }
        
    }
    
    func requestCompanyInfoData(_ companyCode: String) {
        
        var parameter: RequestCompanyInfo = RequestCompanyInfo()
        parameter.companyCd = companyCode
        
        if let param = getParameterJson(parameter: parameter) {
            OpenApiManager.sharedInstance
                .requestCompanyInfo(Params: param, ServiceMode: .CompanyInfo) { data in
                    do {
                        let companyInfoData = try JSONDecoder().decode(ResponceCompanyInfo.self, from: data)
                        print(companyInfoData.companyInfoResult)
                        
                    } catch {
                        print(error)
                    }
                } FailError: { errorCode in
                    print("OpenApiManager error \(errorCode)")
                }
        }
        
    }
    
    func requestMovieInfoData(_ movieCode: String) {
        
        var parameter: RequestMovieInfo = RequestMovieInfo()
        parameter.movieCd = movieCode
        
        if let param = getParameterJson(parameter: parameter) {
            OpenApiManager.sharedInstance
                .requestMovieInfo(Params: param, ServiceMode: .MovieInfo) { data in
                    do {
                        let movieInfoData = try JSONDecoder().decode(ResponcceMovieInfo.self, from: data)
                        print(movieInfoData.movieInfoResult)
                        
                    } catch {
                        print(error)
                    }
                } FailError: { errorCode in
                    print("OpenApiManager error \(errorCode)")
                }
        }
        
    }
    
    func requestNaverSearchMovieData(movieName: String) {
        
        var parameter: RequestNaverSearchMovie = RequestNaverSearchMovie()
        parameter.query = movieName
        
        if let param = getParameterJson(parameter: parameter) {
            NaverOpenApiManager.sharedInstance
                .requestNaverSearchMovie(Params: param, Completion: { data in
                    do {
                        let decodingData = try JSONDecoder().decode(ResponceNaverSearchMovie.self, from: data)
                        print(decodingData.items)
                        
                        if let item = decodingData.items.first {
                            var tempItem: NaverSearchMovieData = NaverSearchMovieData()
                            tempItem.imageName = item.image
                            tempItem.director = item.director
                            tempItem.actor = item.actor
                            
                            self.subMovieData.updateValue(tempItem, forKey: movieName)
                            
                            self.viewController.setUIImage()
                        }
                    } catch {
                        print(error)
                    }
                }, FailError: { errorCode in
                    print("NaverOpenApiManager error \(errorCode)")
                })
        } else {
            print("NaverOpenApiManager param error")
        }
    }
}


