//
//  BaseViewModel.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//

import Combine

class DisposeObject {
    var deinitCalled: (() -> Void)?
    var cancelLables: Set<AnyCancellable>
    
    init() {
        self.cancelLables = Set<AnyCancellable>()
    }
    
    deinit {
        self.cancelLables.removeAll()
        deinitCalled?()
    }
}
