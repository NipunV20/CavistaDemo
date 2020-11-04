//
//  SelectedObjectViewController.swift
//  CavistaDemo
//
//  Created by Apple on 04/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SDWebImage

class SelectedObjectViewController: UIViewController {

    lazy var hearderVw = UIView()
    lazy var hearderTitleLbl = UILabel()
    lazy var backButton = UIButton()
    
    lazy var selectedImage = UIImageView()
    lazy var selectedTextBox = UITextView()
    
    var selectedDataElement: DataListElement?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupHeaderVwUI()
        if  selectedDataElement?.type == .image {
            displayImageView()
        } else {
            displayTextViewUI()
        }
        self.view.backgroundColor = UIColor.white
    }
    
    //MARK:- Configure UI
    // MARK:- Header View UI Setup
    func setupHeaderVwUI() {
        // MARK:- Header View UI Setup
        hearderVw.backgroundColor = UIColor.init(red: 51/255, green: 61/255, blue: 68/255, alpha: 1)
        self.view.addSubview(hearderVw)
        
        // MARK:- Header View Constraint
        
        hearderVw.snp.makeConstraints { (constraint) in
            constraint.leading.trailing.top.equalTo(0)
            constraint.height.equalTo(100)
        }
        // MARK:- Header Title Label UI Setup
        hearderTitleLbl.textColor = UIColor.white
        hearderTitleLbl.font = UIFont.boldSystemFont(ofSize: 20)
        hearderTitleLbl.textAlignment = .center
        hearderTitleLbl.text = (selectedDataElement?.type).map { $0.rawValue }
        hearderVw.addSubview(hearderTitleLbl)
        
        // MARK:- Header Label Constraint
        
        hearderTitleLbl.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(50)
            constraint.trailing.equalTo(-50)
            constraint.bottomMargin.equalTo(-10)
        }
        
        backButton.setImage(UIImage.init(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)

        hearderVw.addSubview(backButton)
        backButton.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(5)
            constraint.bottomMargin.equalTo(0)
            constraint.width.equalTo(40)
            constraint.height.equalTo(40)
        }
    }

    
    // MARK:- Show ImageView UI
    
    func displayImageView() {
        
        selectedImage.contentMode = .scaleAspectFit
        selectedImage.clipsToBounds = true
        self.view.addSubview(selectedImage)
        selectedImage.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(10)
            constraint.trailing.equalTo(-10)
            constraint.topMargin.equalTo(100)
            constraint.bottomMargin.equalTo(-10)
        }
        let imageLink = selectedDataElement?.data
        if imageLink?.count ?? 0 > 0 {
            if let imgURL = URL.init(string: imageLink!) {
                selectedImage.sd_setImage(with: imgURL)
            }
        }

    }
    
    // MARK:- Show Text View UI
    
    func displayTextViewUI() {
        selectedTextBox.textColor = UIColor.black
        selectedTextBox.isUserInteractionEnabled = false
        selectedTextBox.text = selectedDataElement?.data
        self.view.addSubview(selectedTextBox)
        selectedTextBox.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(10)
            constraint.trailing.equalTo(-10)
            constraint.topMargin.equalTo(100)
            constraint.bottomMargin.equalTo(-10)
        }
    }
    
    // MARK:- Action
    
    @objc func pressed() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
