//
//  RxConvert_UITests.swift
//  RxConvert UITests
//
//  Created by Alvin Tu on 3/7/21.
//

import XCTest

class RxConvert_UITests: XCTestCase {

 
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        let kilogramsTextField = app.textFields["kilogramsTextField"]
        kilogramsTextField.tap()
        kilogramsTextField.typeText("1")
        snapshot("01KilosToPounds")

        
        let poundsTextField = app.textFields["poundsTextField"]
        poundsTextField.tap()
        poundsTextField.typeText("11")
        snapshot("02KilosToPounds")


        
        

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
