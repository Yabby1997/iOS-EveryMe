//
//  CoordinatableViewModel.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import Combine
import Foundation

class CoordinatableViewModel {
    var disappearSignalPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    func viewDidDisappear() {
        self.disappearSignalPublisher.send(())
    }
}
