//
//  ViewController.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import UIKit

class ViewController: UIViewController {
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.view.backgroundColor = .yellow
    }
}
