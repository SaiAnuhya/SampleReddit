//
//  FeedResponse.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/9/20.
//

import Foundation

enum ResponseStatus
{
    case success
    case error
    case none
}

struct FeedResponse  {
    var feeds : [Feed] = []
    var after: String = ""
    var status : ResponseStatus = .none
}

