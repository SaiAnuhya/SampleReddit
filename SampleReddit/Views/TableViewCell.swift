//
//  TableViewCell.swift
//  SampleReddit
//
//  Created by Anuhya Kodimela on 12/9/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var verticalStackView = UIStackView()
    var horizontalStackView = UIStackView()
    var cellImageView = CustomImageView.init(image:  #imageLiteral(resourceName: "placeholder"))
    var title = UILabel()
    var commentNumber = UILabel()
    var score = UILabel()
    var stackView = UIStackView()
    var scoreImg = UIImageView()
    var commentsImg = UIImageView()
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?){
        super.init(style : style, reuseIdentifier : reuseIdentifier)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .white
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 7, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with feed: Feed) {
        backgroundColor = .darkGray
        contentView.addSubview(verticalStackView)
        configureVerticalStackView()
        score.text = String(feed.score)
        configureCommentsImg()
        configureScoreImg()
        configureScore()
        configureHorizontalStackView()
        configureCommentsNumber()
        configureTitle(with :feed.title)
        commentNumber.text = String(feed.comments)
        configureImageView(aspectRatio: feed.aspectRatio,imgUrl: feed.imageUrl)
        horizontalStackView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor, multiplier: 1).isActive = true
    }
    
    func configureVerticalStackView(){
        verticalStackView.occupySuperView(superview: contentView)
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.alignment = .center
        verticalStackView.layoutMargins = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        [title,cellImageView,horizontalStackView].forEach({verticalStackView.addArrangedSubview($0)})
    }
    
    func configureHorizontalStackView(){
        horizontalStackView.axis = .horizontal
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        horizontalStackView.isLayoutMarginsRelativeArrangement = true
        horizontalStackView.spacing = 10
        [scoreImg,score,commentsImg,commentNumber].forEach({horizontalStackView.addArrangedSubview($0)})
    }
    
    func configureScoreImg(){
        scoreImg.image =  #imageLiteral(resourceName: "likes")
        scoreImg.translatesAutoresizingMaskIntoConstraints = false
        scoreImg.setConstraint(attribute: .width, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        scoreImg.setConstraint(attribute: .height, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 40)
    }
    
    func configureCommentsImg(){
        commentsImg.image =  #imageLiteral(resourceName: "comments")
        commentsImg.translatesAutoresizingMaskIntoConstraints = false
        commentsImg.setConstraint(attribute: .width, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        commentsImg.setConstraint(attribute: .height, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 40)
    }
    
    func configureScore(){
        score.font = .preferredFont(forTextStyle: .subheadline)
        score.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        score.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        score.setConstraint(attribute: .width, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 80)
    }
    
    func configureCommentsNumber(){
        commentNumber.font = .preferredFont(forTextStyle: .subheadline)
        commentNumber.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        commentNumber.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        commentNumber.setConstraint(attribute: .width, relatedBy: .equal, toItem: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 80)
    }
    
    func configureImageView(aspectRatio: Double, imgUrl: String){
        cellImageView.removeConstraints(cellImageView.constraints)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor, constant: -20).isActive = true
        cellImageView.contentMode = .scaleToFill
        if(aspectRatio != 0){
            cellImageView.setConstraint(attribute: .height, relatedBy: .equal, toItem: cellImageView, toAttribute: .width, multiplier: aspectRatio, constant: 0)
        }else{
            cellImageView.setConstraint(attribute: .height, relatedBy: .equal, toItem: cellImageView, toAttribute: .width, multiplier: 1, constant: 0)
        }
        cellImageView.loadImage(imgURL:URL(string: imgUrl))
    }
    
    func configureTitle(with text:String){
        title.text = text
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.textAlignment = .center
        title.font = .preferredFont(forTextStyle: .largeTitle)
        title.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor, constant: -20).isActive = true
      
    }
}


