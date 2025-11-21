//
//  ProductListViewModel.swift
//  EasyStore
//
//  Created by Jorge Mayta on 13/11/25.
//



import Combine
import Foundation

class ProductListViewModel: ObservableObject {
    @Published var uiState: UiState<[Product]>
    = UiState(status: .initial, value: [], message: nil)
    
    let service = ProductService.shared
    
    
    func getAllProducts() {
        uiState =  uiState.copy(status: Status.loading)
        self.service.getProducts { result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    
                    self.uiState = self.uiState.copy(status: .success, value: products)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.uiState = self.uiState.copy(status: .failure, message: error.rawValue)
                }
                
            }
        }
        
        
    }
    
}

enum Status {
    case initial
    case loading
    case success
    case failure
}

struct UiState<T> {
    let status: Status
    let value: T
    let message: String?
    
    func copy(
        status: Status? = nil,
        value: T? = nil,
        message: String? = nil
        
    ) -> UiState<T> {
        UiState(status: status ?? self.status,
                value: value ?? self.value,
                message: message ?? self.message)
    }
}
