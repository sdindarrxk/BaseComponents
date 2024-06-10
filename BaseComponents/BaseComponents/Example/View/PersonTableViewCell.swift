//
//  PersonTableViewCell.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class PersonTableViewCell: BaseTableViewCell<Person> {
    
    private let nameLabel = UILabel()
    private let ageLabel = UILabel()
    private let jobLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func initializeCell() {
        super.initializeCell()
    }
    
    override func setupCell() {
        super.setupCell()
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, ageLabel, jobLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    override func configureCell(with data: Person) {
        super.configureCell(with: data)
        
        nameLabel.text = "Name: \(data.firstName) \(data.lastName)"
        ageLabel.text = "Age: \(data.age)"
        jobLabel.text = "Job: \(data.job)"
    }
}
