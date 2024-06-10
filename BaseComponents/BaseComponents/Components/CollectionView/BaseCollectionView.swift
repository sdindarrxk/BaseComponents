//
//  BaseCollectionView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseCollectionView: UICollectionView {

    // MARK: - Initialization
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() { }
    
    // MARK: - Registration and Dequeuing
    func registerCell<T: BaseCollectionViewCell<U>, U>(with type: T.Type) {
        register(T.nibName, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeCell<T: BaseCollectionViewCell<U>, U>(indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else { fatalError("Please Register Cell") }
        return cell
    }
}
