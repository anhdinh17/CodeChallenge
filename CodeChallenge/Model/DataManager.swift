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
    
    let urlString: String = "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json"
    
    func fetchData(){
        // use Alamorefire to make request to the url and get response
        AF.request(urlString).response { (response) in
            
            if let data = response.data{
                
                // convert data to String
                let stringData = String(data: data, encoding: .utf8)
                
                //print(data)
                self.delegate?.updateArray(stringData!)
            }
            
        }
        
    }
    
}
