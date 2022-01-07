//
//  PhotoListCoordinator.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import Combine
import UIKit

class PhotoListViewCoordinator: AnyCoordinator {
    func start() {
        guard let presenter = self.presenter as? UINavigationController else { return }
        
        let viewModel = PhotoListViewModel()
        let viewController = PhotoListViewController(viewModel: viewModel)
        
        presenter.pushViewController(viewController, animated: true)
    }
}
