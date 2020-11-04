//
//  ViewController.swift
//  CavistaDemo
//
//  Created by Apple on 04/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SnapKit

fileprivate let cellID = "DataCell"
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var hearderView = UIView()
    lazy var hearderTitleLabel = UILabel()
    lazy var dataListTable = UITableView()
    
    let viewModel = ViewControllerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        setupHeaderViewUI()
        setupListViewUI()
        viewModel.fetchDataFromServer()
        viewModel.reloadTableViewData = {
            self.dataListTable.reloadData()
        }
    }
    
    //MARK:- Configure UI
    // MARK:- Header View UI Setup
    func setupHeaderViewUI() {
        // MARK:- Header View UI Setup
        hearderView.backgroundColor = UIColor.init(red: 51/255, green: 61/255, blue: 68/255, alpha: 1)
        self.view.addSubview(hearderView)
        
        // MARK:- Header View Constraint
        
        hearderView.snp.makeConstraints { (constraint) in
            constraint.leading.trailing.top.equalTo(0)
            constraint.height.equalTo(100)
        }
        // MARK:- Header Title Label UI Setup
        hearderTitleLabel.textColor = UIColor.white
        hearderTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        hearderTitleLabel.textAlignment = .center
        hearderTitleLabel.text = "Data List"
        hearderView.addSubview(hearderTitleLabel)
        
        // MARK:- Header Label Constraint
        
        hearderTitleLabel.snp.makeConstraints { (constraint) in
            constraint.leading.equalTo(10)
            constraint.trailing.equalTo(-10)
            constraint.bottomMargin.equalTo(-10)
        }
    }
    // MARK:- Data List Table View UI Setup
    func setupListViewUI() {
        
        dataListTable.dataSource = self
        dataListTable.delegate = self
        dataListTable.estimatedRowHeight = 100
        dataListTable.rowHeight = UITableView.automaticDimension
        dataListTable.register(DalaCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(dataListTable)
        
        dataListTable.translatesAutoresizingMaskIntoConstraints = false
        dataListTable.snp.makeConstraints { (constraint) in
            constraint.leading.trailing.equalTo(0)
            constraint.bottomMargin.equalTo(0)
            constraint.topMargin.equalTo(80)
            self.dataListTable.reloadData()
        }
    }
    
     //MARK:- TableView DataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? DalaCell
        cell?.configure(dataObj: viewModel.dataList[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewModel.dataList[indexPath.row].type == .image {
            return 200
        }
        if UITableView.automaticDimension > 50 {
            let val = UITableView.automaticDimension
            return val + 30
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.dataList[indexPath.row]
        let  vc = SelectedObjectViewController()
        vc.selectedDataElement = data
        self.present(vc, animated: true, completion: nil)
    }
    
}

