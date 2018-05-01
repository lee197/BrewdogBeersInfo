//
//  BrewdogBeersTests.swift
//  BrewdogBeersTests
//
//  Created by 李祺 on 27/04/2018.
//  Copyright © 2018 Dropkitchen. All rights reserved.
//

import XCTest
@testable import BrewdogBeers
import ObjectMapper

class BrewdogBeersTests: XCTestCase {
    
    var brewdogBeersDetailViewModel: BrewdogBeersDetailViewModel?
    
    
    var beersProcessingListViewModelMethodTest: BrewdogBeersProcessingListViewModel?
    var beersProcessingListViewModelMaltTest: BrewdogBeersProcessingListViewModel?
    var beersProcessingListViewModelHopsTest: BrewdogBeersProcessingListViewModel?

    override func setUp() {
        super.setUp()
        
        let target: NetworkingManager = .beers

        let sampleData = target.sampleData
        let message = String(data: sampleData, encoding: .utf8)
        
        let testModel = Mapper<BrewdogBeersModel>().map(JSONString: message!)!
        
         brewdogBeersDetailViewModel=BrewdogBeersDetailViewModel.init(brewdogBeersModel: testModel)
        
        beersProcessingListViewModelMethodTest=BrewdogBeersProcessingListViewModel.init(brewdogBeersModel: testModel, indexPath: IndexPath(row: 4, section: 0))
        
        beersProcessingListViewModelMaltTest=BrewdogBeersProcessingListViewModel.init(brewdogBeersModel: testModel, indexPath: IndexPath(row: 5, section: 0))

        
        beersProcessingListViewModelHopsTest=BrewdogBeersProcessingListViewModel.init(brewdogBeersModel: testModel, indexPath: IndexPath(row: 6, section: 0))

         

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        

        
    XCTAssertTrue(brewdogBeersDetailViewModel?.getImageURLString()=="https://images.punkapi.com/v2/keg.png")
    XCTAssertTrue(brewdogBeersDetailViewModel?.getBeerProcessingInfo()==["Display all methods","Display all malts","Display all hops"])
    XCTAssertTrue(brewdogBeersDetailViewModel?.getBeerInfo()==["Buzz","A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.","4.5"])

        
    XCTAssertTrue(beersProcessingListViewModelMethodTest?.getTitleonVC()=="Methods")
    XCTAssertTrue(beersProcessingListViewModelMaltTest?.getTitleonVC()=="Malts")
    XCTAssertTrue(beersProcessingListViewModelHopsTest?.getTitleonVC()=="Hops")

        
    XCTAssertTrue(beersProcessingListViewModelMethodTest?.numberOfRowsInTableViewSection()==1)
    XCTAssertTrue(beersProcessingListViewModelMaltTest?.numberOfRowsInTableViewSection()==3)
    XCTAssertTrue(beersProcessingListViewModelHopsTest?.numberOfRowsInTableViewSection()==5)

        
        
    XCTAssertTrue(beersProcessingListViewModelMethodTest?.getProcessName(indexPath: IndexPath(row: 0, section: 0))=="temperature with duration: 75 seconds")
    XCTAssertTrue(beersProcessingListViewModelMaltTest?.getProcessName(indexPath: IndexPath(row: 0, section: 0))=="Maris Otter Extra Pale")
    XCTAssertTrue(beersProcessingListViewModelHopsTest?.getProcessName(indexPath: IndexPath(row: 0, section: 0))=="Fuggles")
        
        XCTAssertTrue(beersProcessingListViewModelMethodTest?.getProcessTemp(indexPath: IndexPath(row: 0, section: 0))=="64.00 celsius")
        XCTAssertTrue(beersProcessingListViewModelMaltTest?.getProcessTemp(indexPath: IndexPath(row: 0, section: 0))=="3.30 kilograms")
        XCTAssertTrue(beersProcessingListViewModelHopsTest?.getProcessTemp(indexPath: IndexPath(row: 0, section: 0))=="25.00 grams")


    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
