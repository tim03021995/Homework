////
////  MainVC+UserDefaults.swift
////  RedSo
////
////  Created by Alvin Tseng on 2020/11/14.
////
//
// import Foundation
//
// class DataManager {
//    static let shared = DataManager()
//    private init() {
//        loadData()
//    }
//
//    var pageData: AllData!
//    private func loadData() {
//        if let data = UserDefaults.standard.value(forKey: "allData") as? Data {
//            print("get!!")
//            let allData = try? PropertyListDecoder().decode(AllData.self, from: data)
//            pageData = allData!
//        } else {
//            print("nil")
//            resetData()
//        }
//    }
//
//    private func saveData() {
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(pageData), forKey: "allData")
//        print("saveData!!")
//    }
//
//    func savePageData(pageType: PageType, page: Int, results: [ResultCell]) {
//        pageData.pageStyle![pageType.rawValue].pages![page].results = results
//        saveData()
//    }
//
//    func getData(pageType: PageType, page: Int) -> [ResultCell]? {
//        if let results = pageData.pageStyle![pageType.rawValue].pages![page].results {
//            return results
//        }
//        return nil
//        //        print(pageType.rawValue)
//        //        if let pageData = pageData {
//        //            if let pageStyle = pageData.pageStyle?[pageType.rawValue] {
//        //                if let pages = pageStyle.pages?[page] {
//        //                    if let result = pages.results {
//        //                        print("LoadUserDefault Sucess")
//        //                        return result
//        //                    }
//        //                    print("result Error")
//        //                }
//        //                print("pages Error")
//        //            }
//        //            print("pageStyle Error")
//        //        }
//        //        print("LoadUserDefault Error")
//    }
//
//    func resetData() {
//        let newResults: [ResultCell] = []
//        let newList = List(results: newResults)
//        let newPages: [List] = [newList, newList, newList, newList, newList, newList, newList, newList, newList, newList]
//        let newPageStyle = PageStyle(pages: newPages)
//        pageData = AllData(pageStyle: [newPageStyle, newPageStyle, newPageStyle])
//    }
// }
