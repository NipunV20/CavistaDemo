//
//  DalaCell.swift
//  CavistaDemo
//
//  Created by Apple on 04/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class DalaCell: UITableViewCell {

    lazy var titleLbl = UILabel()
    lazy var imageVw = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor.white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupTableViewCellUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewCellUI() {
        titleLbl.textAlignment = .left
        titleLbl.text = ""
        titleLbl.textColor = UIColor.black
        titleLbl.sizeToFit()
        titleLbl.numberOfLines = 0
        self.addSubview(titleLbl)
        
        titleLbl.snp.makeConstraints { (constraint) in
            constraint.leading.top.equalTo(10)
            constraint.trailing.equalTo(-10)
        }

        imageVw.contentMode = .scaleAspectFit
        imageVw.clipsToBounds = true
        self.addSubview(imageVw)
        imageVw.snp.makeConstraints { (constraint) in
            constraint.leading.top.equalTo(10)
            constraint.trailing.equalTo(-10)
            constraint.bottomMargin.equalTo(-10)
        }
        
    }
    
    func configure(dataObj: DataListElement) {
        if dataObj.type == .image {
            let imageLink = dataObj.data
            if imageLink?.count ?? 0 > 0 {
                if let imgURL = URL.init(string: imageLink!) {
                    imageVw.isHidden = false
                    titleLbl.isHidden = true
                    imageVw.sd_setImage(with: imgURL)
                }
            }
        } else {
            imageVw.isHidden = true
            titleLbl.isHidden = false
            titleLbl.text = dataObj.data
        }
        
    }
    
}
