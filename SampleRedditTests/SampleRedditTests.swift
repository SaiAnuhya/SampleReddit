//
//  SampleRedditTests.swift
//  SampleRedditTests
//
//  Created by Anuhya Kodimela on 12/13/20.
//

import XCTest
@testable import SampleReddit

class SampleRedditTests: XCTestCase, TableViewModelDelegate {
    
    private var mockNetworkClient : MockNetworkClient?
    private var viewModelTest : TableViewModel?
    
    override func setUpWithError() throws {
        mockNetworkClient = MockNetworkClient()
        viewModelTest = TableViewModel.init(delegate: self, networkClient: mockNetworkClient!)
        super.setUp()
        
    }
    
    func testFetchDataInvocation() throws {
            viewModelTest?.fetchFeedData()
            print(mockNetworkClient!.isFetchCalled)
            XCTAssert(mockNetworkClient!.isFetchCalled)
    }
    
    func testDeserialization() throws {
        
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "sampleInputTest", ofType: "txt")!
        let jsonData =  NSData(contentsOfFile: path)
        let feedResponse = DataSerializer.deSerialize(with: jsonData! as Data)
        XCTAssert(feedResponse?.status == ResponseStatus.success)
        XCTAssert(feedResponse?.after == "t3_kcj9fq")
        XCTAssert(feedResponse?.feeds.count == 2)
        XCTAssert(feedResponse?.feeds[0].title == "Nothing to see here")
        XCTAssert(feedResponse?.feeds[0].imageWidth == 140)
        XCTAssert(feedResponse?.feeds[1].comments == 354)
        
           
    }
    
    func onFetchCompleted() {
        
    }
    
    func onFetchFailed(with reason: String) {
        
    }
    
    override func tearDownWithError() throws {
        viewModelTest = nil
        mockNetworkClient = nil
        super.tearDown()
    }

}
