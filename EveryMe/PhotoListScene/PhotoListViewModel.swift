//
//  PhotoListViewModel.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import Combine
import Foundation

protocol PhotoListViewModelInput {
    func shareButtonDidTap()
    func cameraButtonDidTap()
}

protocol PhotoListViewModelOutput {
    var cameraButtonDidTapSignalPublisher: PassthroughSubject<Void, Never> { get }
    var shareButtonDidTapSignalPublisher: PassthroughSubject<Void, Never> { get }
}

typealias PhotoListViewModelProtocol = PhotoListViewModelInput & PhotoListViewModelOutput

class PhotoListViewModel: CoordinatableViewModel, PhotoListViewModelProtocol {
    var cameraButtonDidTapSignalPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    var shareButtonDidTapSignalPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    func cameraButtonDidTap() {
        self.cameraButtonDidTapSignalPublisher.send(())
    }
    
    func shareButtonDidTap() {
        self.shareButtonDidTapSignalPublisher.send(())
    }
}
