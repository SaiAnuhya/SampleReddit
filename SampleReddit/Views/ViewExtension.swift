//
//  ViewExtension.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/12/20.
//

import UIKit

extension UIView{
    
    func occupySuperView(superview: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.rightAnchor).isActive = true
        leftAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
    
    func setConstraint(attribute: NSLayoutConstraint.Attribute, relatedBy: NSLayoutConstraint.Relation, toItem: Any?, toAttribute: NSLayoutConstraint.Attribute, multiplier: Double, constant: CGFloat){
        self.addConstraint(NSLayoutConstraint(
                            item: self,
                            attribute: attribute,
                            relatedBy: .equal,
                            toItem: toItem,
                            attribute: toAttribute,
                        multiplier: CGFloat(multiplier),
                            constant: constant))
    }
}
