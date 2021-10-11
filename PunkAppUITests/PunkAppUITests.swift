//
//  PunkAppUITests.swift
//  PunkAppUITests
//
//  Created by David on 7/10/21.
//

import XCTest

class PunkAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    static var launched = false

    override func setUpWithError() throws {
        if (!PunkAppUITests.launched) {
            app.launch()
            PunkAppUITests.launched = true
        }
        
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
    }

    func testCell() throws {
        
        XCTAssert(app.tables.element.exists)
        
        let firstCell = app.tables.firstMatch.cells.firstMatch
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: firstCell, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssert(firstCell.isHittable)
        firstCell.staticTexts.firstMatch.tap()
        
        XCTAssert(app.navigationBars.element.firstMatch.exists)
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
    }
    
    func testSearchBar() throws {
        let searchBar = app.textFields.firstMatch
        XCTAssert(searchBar.exists)
        
        searchBar.tap()
        searchBar.typeText("Meat")
        XCTAssert(app.tables.firstMatch.cells.firstMatch.waitForExistence(timeout: 5))
    }

    func testMenu() throws {
        let floatingButton = app.buttons["FloatingMenu"].firstMatch
        XCTAssert(floatingButton.exists)
        
        floatingButton.tap()
        sleep(1)
        let btnRandomBeer = app.staticTexts["FloatingMenuBtn1"]
        XCTAssert(btnRandomBeer.exists)
        btnRandomBeer.tap()
    }
}
