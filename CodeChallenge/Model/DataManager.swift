//
//  DataManager.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/13/21.
//

import Foundation
import Alamofire

protocol DataDelegate {
    func updateArray(_ data: String)
}

class DataManager{
    // singleton
    static let shared = DataManager()
    
    var delegate: DataDelegate?
    
    func fetchData(){
        // use Alamorefire to make request to the url and get response
        AF.request("https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json").response { (response) in
            
            if let data = response.data{
                
                let stringData = String(data: data, encoding: .utf8)
                
                //print(data)
                self.delegate?.updateArray(stringData!)
            }
            
        }
    }
    
}
