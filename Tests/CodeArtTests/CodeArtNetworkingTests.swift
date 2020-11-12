//
//  CodeArtNetworkingTests.swift
//  CodeArtTests
//
//  Created by Willian Guedes on 07/11/20.
//

import XCTest
@testable import CodeArt

class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completitionHandler: @escaping (Data?, Error?) -> Void) {
        completitionHandler(data, error)
    }
    
    func post(with url: URLRequest, completetionHandler completitionHandler: @escaping (Data?, Error?) -> Void) {
        completitionHandler(data, error)
    }
}

struct MockData: Codable, Equatable {
    var id: Int
    var name: String
}

final class CodeArtNetworkingTests: XCTestCase {
    
    func testLoadDataCell () {
        let manager = CodeArt.Networking.Manager()
        let session = NetworkSessionMock()
        manager.session = session
        
        let expectation = XCTestExpectation(description: "Called for data")
        let data = Data([0, 1, 0, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    XCTAssertEqual(data, returnedData, "manager returned unexpected data")
                case .failure(let error):
                    XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testSendDataCall() {
        let session = NetworkSessionMock()
        let manager = CodeArt.Networking.Manager()
        let mockObject = MockData(id: 1, name: "Willian")
        let data = try? JSONEncoder().encode(mockObject)
        
        session.data = data
        manager.session = session
        
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "Sent data")
        manager.sendData(to: url, body: mockObject) { result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
                    XCTAssertEqual(returnedObject, mockObject)
                case .failure(let error):
                    XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    static var allTests = [
        ("testLoadDataCell", testLoadDataCell),
        ("testSendDataCall",testSendDataCall)
    ]
}
