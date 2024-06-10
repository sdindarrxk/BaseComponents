//
//  PersonTableView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class PersonTableView: BaseTableView, UITableViewDataSource, UITableViewDelegate {
    
    var items: [Person] = [] {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        delegate = self
        dataSource = self
        registerCell(with: PersonTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: BaseTableView, cellForRowAt indexPath: IndexPath) -> BaseTableViewCell<Any> {
        let item = items[indexPath.row]
        guard let cell: PersonTableViewCell = tableView.dequeCell(indexPath: indexPath) else {
            fatalError("Could not dequeue cell")
        }
        
        cell.configureCell(with: item)
        return cell
    }
}
