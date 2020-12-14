//
//  CustomImageView.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/11/20.
//

import UIKit

class CustomImageView : UIImageView{
    
    private let imageCache = NSCache<AnyObject, UIImage>()
   
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadImage(imgURL: URL?)
    {
        self.image = #imageLiteral(resourceName: "placeholder")
        if let cacheImage = self.imageCache.object(forKey: imgURL as AnyObject){
            self.image = cacheImage
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            [weak self] in
            if let url = imgURL{
                if let imageData = try? Data(contentsOf: url)
                {
                    if let image = UIImage(data: imageData)
                    {
                        DispatchQueue.main.async {
                            self?.image = image
                            self?.imageCache.setObject(image, forKey: url as AnyObject)
                        }
                    }
                }
                else{
                    let image = #imageLiteral(resourceName: "invalidURLfromserver.png")
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
