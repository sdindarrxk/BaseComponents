//
//  BaseViewController.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseViewController<V>: UIViewController {
    
    // MARK: - Properties
    var viewModel: V!
    var viewTitle: String? { return nil }
    
    // MARK: - Initialization
    convenience init(viewModel: V) {
        self.init()
        self.viewModel = viewModel
        prepareViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewController()
    }
    
    // MARK: - Helper Methods
    func prepareViewController() {
        title = viewTitle
        view.backgroundColor = .white
    }
    
    // MARK: - Identifier
    public static var identifier: String {
        return String(describing: self)
    }
}
