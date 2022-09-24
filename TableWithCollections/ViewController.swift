//
//  ViewController.swift
//  TableWithCollections
//
//  Created by Guillermo Saavedra Dorantes on 23/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
        tabla.register(UINib(nibName: "TableViewCell", bundle: .main), forCellReuseIdentifier: TableViewCell.cellIdentifier)
        tabla.delegate = self
        tabla.dataSource = self
        tabla.allowsSelection = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableInfo.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellIdentifier) as? TableViewCell else { return UITableViewCell() }
        let cellInfo = tableInfo[indexPath.row]
        cell.backgroundColor = cellInfo.color
        cell.titleLabel.text = cellInfo.cellTitle
        cell.cellInfo = cellInfo
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellInfo = tableInfo[indexPath.row]
        return getCellHeight(for: cellInfo.numberOfItems)
    }
    
    func getCellHeight(for items: Int) -> CGFloat {
        var rows = CGFloat(items / 3) + (items % 3 == 0 ? 0 : 1)
        rows = rows > 0 ? rows : 1
        return CGFloat((100 * rows) + (10 * rows) + 40)
    }
}
