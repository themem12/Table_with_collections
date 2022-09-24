//
//  Model.swift
//  TableWithCollections
//
//  Created by Guillermo Saavedra Dorantes on 23/09/22.
//

import UIKit

struct TableCellInfo {
    let cellId: Int
    let color: UIColor
    let numberOfItems: Int
    
    var cellTitle: String {
        return "Celda #\(cellId)"
    }
    
    init(cellId: Int, color: UIColor) {
        self.cellId = cellId
        self.color = color
        self.numberOfItems = Int.random(in: 0..<10)
    }
    
    init() {
        self.cellId = 0
        self.color = .clear
        self.numberOfItems = 0
    }
}

let tableInfo: [TableCellInfo] = [
    TableCellInfo(cellId: 1, color: .red),
    TableCellInfo(cellId: 2, color: .blue),
    TableCellInfo(cellId: 3, color: .gray),
    TableCellInfo(cellId: 4, color: .green),
    TableCellInfo(cellId: 5, color: .brown),
    TableCellInfo(cellId: 6, color: .cyan),
]
