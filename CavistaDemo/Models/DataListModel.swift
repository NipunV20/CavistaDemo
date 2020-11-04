//
//  DataListModel.swift
//  CavistaDemo
//
//  Created by Apple on 04/11/20.
//  Copyright © 2020 Apple. All rights reserved.
//


import Foundation

// MARK: - DataListElement
struct DataListElement: Codable {
    let id: String?
    let type: TypeEnum?
    let date: String?
    let data: String?
}

enum TypeEnum: String, Codable {
    case image = "image"
    case other = "other"
    case text = "text"
}

typealias DataList = [DataListElement]
