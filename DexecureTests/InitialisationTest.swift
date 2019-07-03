//
//  InitialisationTest.swift
//  DexecureTests
//
//  Copyright © 2019 net.Dexecure. All rights reserved.
//

import XCTest
@testable import Dexecure

class InitialisationTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHost(){
        let client = Dexecure.init(host: "beek.dexecure.net")
        XCTAssert(client.host == "beek.dexecure.net")
    }
    
    func testDefaultsToHttpsUrls() {
        let client = Dexecure.init(host: "beek.dexecure.net")
        XCTAssert(client.useHttps == true)
    }
    

}
