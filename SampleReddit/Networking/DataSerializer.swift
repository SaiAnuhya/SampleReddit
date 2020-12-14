//
//  DataSerializer.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/13/20.
//

import Foundation

struct DataSerializer
{
    static func deSerialize(with data: Data?) -> FeedResponse?{
        guard data != nil else{
            return nil
        }
        var feedresponse = FeedResponse.init()
        //json -> data -> dist(noofitems) , childten[items]
        //children -> data -> title, thumbnail,num_comments,score,thumbnail_width,thumbnail_height
        let serializedJson = try? JSONSerialization.jsonObject(with: data!, options: [])
            if let kindDataDict = serializedJson as? [String: Any] {
            let dataDict = kindDataDict["data"] as! Dictionary<String, Any>
            let children  = dataDict["children"] as! [Dictionary<String,Any>]
            let after = dataDict["after"] as? String
            feedresponse.after = after ?? ""
            
            for entry in children{
                let requiredInfo = entry["data"] as! Dictionary<String,Any>
                let title = requiredInfo["title"] as? String
                let thumbnail = requiredInfo["thumbnail"] as? String
                let comments = requiredInfo["num_comments"] as? Int
                let score = requiredInfo["score"] as? Int
                let width = requiredInfo["thumbnail_width"] as? Double
                let height = requiredInfo["thumbnail_height"] as? Double
                let feed = Feed.init(imageUrl: thumbnail ?? "", comments: comments!, score: score ?? 0, imageWidth: width ?? 0, imageHeight: height ?? 0, title:title  ?? "")
                feedresponse.feeds.append(feed)
            }
            feedresponse.status = .success
        }
        return feedresponse
    }
}
