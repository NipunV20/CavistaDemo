//
//  ViewControllerModel.swift
//  CavistaDemo
//
//  Created by Apple on 04/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Alamofire

class ViewControllerModel {
    
    var dataList = DataList()
    var reloadTableViewData:(() -> Void)?
    
    func fetchDataFromServer() {
        let apiPath = "https://raw.githubusercontent.com/"
        let url = "AxxessTech/Mobile-Projects/master/challenge.json"
        let fullPath = apiPath + url
        
        Alamofire.request(fullPath, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: nil).validate().responseData { (data) in
            do {
                if data.data != nil {
                    self.dataList = try JSONDecoder().decode(DataList.self, from: data.data!)
                    self.reloadTableViewData?()
                } else {
                    
                }
            } catch {
                print("Error getting data")
            }
        }
    }
    
}
