//
//  FeedModel.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/13/20.
//

import Foundation

struct Feed  {
    var imageUrl : String = ""
    var comments : Int = 0
    var score : Int = 0
    var imageWidth  = 0.0
    var imageHeight  = 0.0
    var title : String = ""
    
    var aspectRatio: Double {
            get
            {
                var ratio = 0.0
                if(imageWidth != 0 && imageHeight != 0)
                {
                    ratio = imageWidth/imageHeight
                }
                return ratio
            }
    }
}
