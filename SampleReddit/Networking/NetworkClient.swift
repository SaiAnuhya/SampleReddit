//
//  NetworkClient.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/9/20.
//

import Foundation

class NetworkClient {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
      self.session = session
    }
    
    func fetchData(with request: URLRequest ,completion: @escaping(FeedResponse?) -> Void) {
        
        let task = session.dataTask(with: request,
                completionHandler: { (data, response, error) in

                    
                    let httpResponse = response as? HTTPURLResponse
                    if httpResponse?.statusCode == 200
                    {
                        let serializedResponse = DataSerializer.deSerialize(with:data)
                        completion(serializedResponse)
                    }
                    else{
                        //failed case
                        var feedresponse = FeedResponse.init()
                        feedresponse.status = .error
                        completion(feedresponse)
                    }
                     
        })
        task.resume()
        
    }
}




