//
//  ModelTests.swift
//  MVVMExampleTests
//
//  Created by pham.minh.tien on 9/18/20.
//  Copyright © 2020 Sun*. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxTest
import RxBlocking
import MVVM

@testable import MVVMExample
class ModelTests: XCTestCase {
    
    private var activityModel: ActivityModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        activityModel = ActivityModel(JSON: ["title":"", "tweets":1, "following": 2, "follower": 3, "likes": 4])
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
