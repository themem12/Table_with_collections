//
//  CollectionViewCell.swift
//  TableWithCollections
//
//  Created by Guillermo Saavedra Dorantes on 23/09/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "CollectionViewCell"
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
    }

}
