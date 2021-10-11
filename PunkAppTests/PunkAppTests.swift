//
//  PunkAppTests.swift
//  PunkAppTests
//
//  Created by David on 7/10/21.
//

import XCTest
@testable import PunkApp

class PunkAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllBeers() throws {
        
        let promise = expectation(description: "Request succeeded")
        let viewModel = BeerListViewModel()
        
        viewModel.getBeerList(page: 1, searchingBy: "") { beerList in
            XCTAssertNotNil(beerList)
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSearchBeers() throws {
        
        let promise = expectation(description: "Request succeeded")
        let viewModel = BeerListViewModel()
        
        viewModel.getBeerList(page: 1, searchingBy: "Meat") { beerList in
            XCTAssert(beerList.count >= 2)
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testSearchBeersEmpty() throws {
        
        let promise = expectation(description: "Request succeeded")
        let viewModel = BeerListViewModel()
        
        viewModel.getBeerList(page: 1, searchingBy: "adnfaonfwofnawd") { beerList in
            XCTAssert(beerList.isEmpty)
            promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)

    }

}
