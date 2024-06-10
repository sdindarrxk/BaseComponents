//
//  BaseTableView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseTableView: UITableView {
    
    // MARK: - Initialization
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() { }
    
    // MARK: - Registration and Dequeuing
    func registerCell<T: BaseTableViewCell<U>, U>(with type: T.Type) {
        register(T.nibName, forCellReuseIdentifier: T.identifier)
    }
    
    func dequeCell<T: BaseTableViewCell<U>, U>(indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError("Please Register Cell") }
        return cell
    }
}
