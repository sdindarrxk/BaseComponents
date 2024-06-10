//
//  GenericModel.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import Foundation

struct GenericModel<T> {
    private var data: T?
    
    mutating func setData(with data: T?) {
        self.data = data
    }
    
    func getData() -> T? {
        return data
    }
}
