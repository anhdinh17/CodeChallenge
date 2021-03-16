//
//  CodeChallengeUITests.swift
//  CodeChallengeUITests
//
//  Created by Anh Dinh on 3/15/21.
//

import XCTest
@testable import CodeChallenge

class CodeChallengeUITests: XCTestCase {
    
    override func setUpWithError() throws {

        continueAfterFailure = false

    }
    
    override func tearDownWithError() throws {

    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // test UITableView
        app.tables.accessibilityScroll(UIAccessibilityScrollDirection(rawValue: 1)!)
        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Data Item #3"]/*[[".cells.staticTexts[\"Data Item #3\"]",".staticTexts[\"Data Item #3\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        // test swiping down controller
        if app.staticTexts["1091"].exists {
            app.staticTexts["1091"].swipeDown()
        }
        
    }
    
    func testLabel(){
        let app = XCUIApplication()
        app.launch()
        
        if app.staticTexts["ID: "].exists {
            app.staticTexts["ID: "].tap()
        }
        if app.staticTexts["Type: "].exists{
            app.staticTexts["Type: "].tap()
        }
        if app.staticTexts["Date: "].exists{
            app.staticTexts["Date: "].tap()
        }
        if app.staticTexts["Data: "].exists{
            app.staticTexts["Data: "].tap()
        }
        
    }
    
    // test Save button
    func testSaveButton(){
        let app = XCUIApplication()
        app.launch()
        
        if app.buttons["SAVE"].exists{
            app.buttons["SAVE"].tap()
        }
        
    }
    
    // test alert
    func testAlert(){
        let app = XCUIApplication()
        app.launch()
        
        if app.alerts["Alert"].exists{
            app.alerts["Alert"].tap()
        }
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
