//
//  CodeArtNetworkingTests.swift
//  CodeArtTests
//
//  Created by Willian Guedes on 07/11/20.
//

import XCTest
@testable import CodeArt

final class CodeArtNetworkingTests: XCTestCase {
    
    func testLoadDataCell () {
        let manager = CodeArt.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else {
            return XCTFail("Could not cresate URL")
        }
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    XCTAssertNotNil(returnedData, "Response data is nil")
                case .failure(let error):
                    XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    static var allTests = [
        ("testExample", testLoadDataCell)
    ]
}
