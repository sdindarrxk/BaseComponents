//
//  PersonViewController.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class PersonViewController: BaseViewController<PersonViewModel> {
    
    // MARK: - Properties
    private var baseTableView: UITableView!
    private var items: [Person] = []
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    // MARK: - UI Preparing
    private func prepareUI() {
        prepareTableView()
        setupData()
    }
    
    private func prepareTableView() {
        baseTableView = UITableView(frame: view.bounds, style: .plain)
        baseTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(baseTableView)
        
        NSLayoutConstraint.activate([
            baseTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            baseTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            baseTableView.topAnchor.constraint(equalTo: view.topAnchor),
            baseTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Register cell
        baseTableView.registerCell(with: PersonTableViewCell.self)
        
        // Set data source and delegate
        baseTableView.dataSource = self
        baseTableView.delegate = self
    }
    
    // MARK: - Setup Data
    private func setupData() {
        // Example data
        items = viewModel.people
        
        // Reload data
        baseTableView.reloadData()
    }
}

// MARK: - TableView Methods
extension PersonViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        
        guard let cell: PersonTableViewCell = tableView.dequeCell(indexPath: indexPath) else {
            fatalError("Could not dequeue cell")
        }
        
        cell.configureCell(with: item)
        return cell
    }
    
    // MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
