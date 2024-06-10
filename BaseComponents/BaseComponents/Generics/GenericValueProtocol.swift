//
//  GenericValueProtocol.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import Foundation

protocol GenericValueProtocol {
    
    // MARK: - Properties
    associatedtype Value
    var value: Value { get }
}
