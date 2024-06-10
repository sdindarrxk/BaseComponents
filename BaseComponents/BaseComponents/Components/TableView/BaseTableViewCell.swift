//
//  BaseTableViewCell.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseTableViewCell<T>: UITableViewCell {
    
    // MARK: - Properties
    private var model = GenericModel<T>()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
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

// MARK: - TableView Extension
extension UITableView {
    func registerCell<T: BaseTableViewCell<U>, U>(with type: T.Type) {
        register(T.nibName, forCellReuseIdentifier: T.identifier)
    }
    
    func dequeCell<T: BaseTableViewCell<U>, U>(indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { fatalError("Please Register Cell") }
        return cell
    }
}
