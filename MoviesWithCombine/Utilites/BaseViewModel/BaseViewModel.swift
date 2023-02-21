//
//  BaseViewModel.swift
//  MoviesWithCombine
//
//  Created by Waleed Saad on 21/02/2023.
//


import Combine

class BaseViewModel: DisposeObject, ObservableObject {
    @Published var state: ViewModelState<BaseError> = .idle
    @Published var alertItem: AlertItem?
}
