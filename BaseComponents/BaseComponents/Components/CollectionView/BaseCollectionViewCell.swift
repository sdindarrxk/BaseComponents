//
//  BaseCollectionViewCell.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseCollectionViewCell<T>: UICollectionViewCell {
    
    // MARK: - Properties
    private var model = GenericModel<T>()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initializeCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeCell()
    }
    
    // MARK: - Cell Configurations
    func initializeCell() { }
    
    func setupCell() { }
    
    // MARK: - Data Handling
    func configureCell(with data: T) {
        model.setData(with: data)
        
        guard model.getData() != nil else { return }
    }
    
    // MARK: - Identifier Methods
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

// MARK: - CollectionView Extension
extension UICollectionView {
    func registerCell<T: BaseCollectionViewCell<U>, U>(with type: T.Type) {
        register(T.nibName, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeCell<T: BaseCollectionViewCell<U>, U>(with indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { fatalError("Please Register Cell") }
        return cell
    }
}

