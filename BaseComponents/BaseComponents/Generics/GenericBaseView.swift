//
//  GenericBaseView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class GenericBaseView<T>: BaseView {
    
    // MARK: - Properties
    private var data: T?
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadData()
    }
    
    init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadData()
    }
    
    // MARK: - Helper Methods
    func loadData() { }
    
    func setData(with value: T?) {
        self.data = value
        loadData()
    }
    
    func getData() -> T? {
        return data
    }
}
