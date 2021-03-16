//
//  CodeChallengeTests.swift
//  CodeChallengeTests
//
//  Created by Anh Dinh on 3/15/21.
//

import XCTest
@testable import CodeChallenge

class CodeChallengeTests: XCTestCase {

    // test if right url is used.
    func testUrlString(usedURL: String, givenURL: String){
        let test = DataManager()
        XCTAssertEqual(test.urlString, "https://raw.githubusercontent.com/AxxessTech/Mobile-Projects/master/challenge.json")
    }
    
    // test if networking func works
    func dataResponse(){
        let test = DataManager()
        XCTAssertNoThrow(test.fetchData())
    }

}
