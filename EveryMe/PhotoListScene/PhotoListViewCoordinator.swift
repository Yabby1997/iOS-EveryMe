//
//  PhotoListCoordinator.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import Combine
import UIKit

class PhotoListViewCoordinator: AnyCoordinator {
    private var cancellables: Set<AnyCancellable> = []
    
    func start() {
        guard let presenter = self.presenter as? UINavigationController else { return }
        
        let viewModel = PhotoListViewModel()
        let viewController = PhotoListViewController(viewModel: viewModel)
        
        viewModel.cameraButtonDidTapSignalPublisher
            .sink { [weak self] _ in
                self?.cameraButtonDidTap()
            }
            .store(in: &self.cancellables)
        
        viewModel.shareButtonDidTapSignalPublisher
            .sink { [weak self] _ in
                self?.shareButtonDidTap()
            }
            .store(in: &self.cancellables)
        
        presenter.pushViewController(viewController, animated: true)
    }
    
    private func cameraButtonDidTap() {
        print("ㅎㅎ")
    }
    
    private func shareButtonDidTap() {
        print("ㅋㅋ")
    }
}
