//
//  MockNetworkClient.swift
//  SampleRedditTests
//
//  Created by Anuhya Kodimela on 12/13/20.
//

import Foundation
@testable import SampleReddit

class MockNetworkClient: NetworkClient {
    var isFetchCalled = false
    
    override func fetchData(with request: URLRequest ,completion: @escaping(FeedResponse?) -> Void){
        isFetchCalled = true
    }
}
