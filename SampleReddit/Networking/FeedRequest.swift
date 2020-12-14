//
//  FeedRequest.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/9/20.
//

import Foundation

struct FeedRequest {
    
    let baseURL = "http://www.reddit.com/.json"
    
    func createRequest( after : String) -> URLRequest
    {
        var feedURL = URL(string:baseURL)
        if after != ""{
            //create and append parameter after to urlrequest
            let queryItems = [URLQueryItem(name: "after", value: after)]
            var urlComps = URLComponents(string: baseURL)!
            urlComps.queryItems = queryItems
            feedURL = urlComps.url!
        }
        return URLRequest(url : feedURL!)
    }
}
