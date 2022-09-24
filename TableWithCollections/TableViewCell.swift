//
//  TableViewCell.swift
//  TableWithCollections
//
//  Created by Guillermo Saavedra Dorantes on 23/09/22.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    public static let cellIdentifier = "cellWithCollection"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var cellInfo: TableCellInfo? {
        didSet {
            collectionView.reloadData()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.register(UINib(nibName: CollectionViewCell.cellIdentifier, bundle: .main), forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        setCellSize()
    }
    
    func setCellSize() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = getSizeForCell()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = flowLayout
    }
    
    func getSizeForCell() -> CGSize {
        let numItems = 3
        let parentViewWidth = self.collectionView.bounds.size.width
        let spaceBetweenCells = 0
        let adjustedWidth = (Int(parentViewWidth) - spaceBetweenCells*numItems)/numItems
        return CGSize(width: adjustedWidth, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.titleLabel.text = "\(cellInfo?.numberOfItems ?? -1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellInfo?.numberOfItems ?? 0
    }
    
}
