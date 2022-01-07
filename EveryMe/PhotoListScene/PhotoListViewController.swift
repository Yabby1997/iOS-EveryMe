//
//  PhotoListViewController.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import UIKit

class PhotoListViewController: UIViewController {
    
    private var viewModel: PhotoListViewModel!
    
    convenience init(viewModel: PhotoListViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .yellow
    }
}
