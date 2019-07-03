//
//  BuildUrlTest.swift
//  DexecureTests
//
//  Created by Anupriya on 03/07/19.
//  Copyright © 2019 net.Dexecure. All rights reserved.
//

import XCTest
@testable import Dexecure

class BuildUrlTest: XCTestCase {
 
     var client: Dexecure!
    
    override func setUp() {
          client = Dexecure.init(host: "beek.dexecure.net")
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
    
    func testBuildUrlWithoutParams(){
        let generatedUrl = client.buildUrl("/proxy/http://demos.imgix.net/bridge.png")
        let expectedUrl = "https://beek.dexecure.net/proxy/http://demos.imgix.net/bridge.png"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlEmptyParams() {
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [:])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlUsingWidth(){
        
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.width : "500"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize=w500"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlUsingHeight(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.height : "500"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize=h500"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlUsingHeightWidth(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.height : "500", Constants.Key.width : "500"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize=h500,w500"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlUsingWidthHeight(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.width : "500", Constants.Key.height : "200"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize=w500,h200"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlResizeCenterCropHeight(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.cropMode : Constants.Value.cropCenter, Constants.Key.height : "200"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize_c=h200"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlResizeCenterCropWidth(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.cropMode : Constants.Value.cropCenter, Constants.Key.width : "500"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize_c=w500"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlResizeCenterCropWidthHeight(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.cropMode : Constants.Value.cropCenter,        Constants.Key.width : "500",
                                                                                                                              Constants.Key.height : "200"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize_c=w500,h200"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlDisableResize(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.resize : Constants.Value.disableResize])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?resize=none"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlOptimizationDefault(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.optimizationMode : Constants.Value.optimizationDefault])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?opt=default"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlOptimizationMild(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.optimizationMode : Constants.Value.optimizationMild])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?opt=mild"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlOptimizationAgressive(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.optimizationMode : Constants.Value.optimizationAggressive])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?opt=aggressive"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlOptimizationNone(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: [Constants.Key.optimizationMode : Constants.Value.optimizationNone])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?opt=none"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlCustomQueryInParam(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["abc" : "def"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?abc=def"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlCustomQueriesInParam(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["key1" : "val1", "key2" : "val2"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?key1=val1&key2=val2"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlCustomQueryAndResize(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["key1" : "val1", Constants.Key.width : "200"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?key1=val1&resize=w200"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlCustomQueryAndOptMode(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["key1" : "val1", Constants.Key.optimizationMode :  Constants.Value.optimizationMild])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?key1=val1&opt=mild"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlCustomQueryAndCropCentre(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["key1" : "val1", Constants.Key.cropMode : Constants.Value.cropCenter,
                                                                                                                              Constants.Key.height : "250"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?key1=val1&resize_c=h250"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildHtppUrl(){
        let clientNew = Dexecure.init(host: "beek.dexecure.net", useHttps: false)
        let generatedUrl = clientNew.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["key1" : "val1", Constants.Key.cropMode : Constants.Value.cropCenter,
                                                                                                                                 Constants.Key.height : "250"])
        let expectedUrl = "http://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?key1=val1&resize_c=h250"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
        
    }
    
    func testBuildUrlUsingEscapedValueInParams(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["custom" : "hello world"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?custom=hello%20world"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlUsingEscapedKeysInParams(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["hello world" : "yes"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?hello%20world=yes"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    
    func testBuildUrlOptimizationDefaultWithoutConstants(){
        let generatedUrl = client.buildUrl("/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg", params: ["opt" : "default"])
        let expectedUrl = "https://beek.dexecure.net/proxy/http://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?opt=default"
        XCTAssert(generatedUrl.absoluteString == expectedUrl)
    }
    

}
