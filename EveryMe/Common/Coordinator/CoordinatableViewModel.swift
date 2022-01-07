//
//  CoordinatableViewModel.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import Combine
import Foundation
import UIKit

class CoordinatableViewModel {
    private (set) var deinitSignalPublisher: PassthroughSubject<Void, Never> = PassthroughSubject()
    
    func sceneDidDeinit() {
        self.deinitSignalPublisher.send(())
    }
}
