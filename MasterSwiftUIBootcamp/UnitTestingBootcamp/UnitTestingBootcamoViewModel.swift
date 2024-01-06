//
//  UnitTestingBootcamoViewModel.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/6/24.
//

import Foundation
import SwiftUI
import Combine


class UnitTestingBootcamoViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray = [String]()
    @Published var selectedItem: String? = nil
    let dataService: NewDataServiceProtocol
    var cancellables = Set<AnyCancellable>()
    
    init(isPremium: Bool, dataService: NewDataServiceProtocol = NewMockDataService(items: nil)) {
        self.dataService = dataService
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else { return }
        dataArray.append(item)
    }
    
    func selectedItem(item: String) {
        if let x = dataArray.first(where: { $0 == item }) {
            selectedItem = x
        }
    }
    
    func saveItem(item: String) throws {
        guard !item.isEmpty else {
            throw DataError.noData
        }
        if let x = dataArray.first(where: { $0 == item }) {
            print("save item here!!! \(x)")
        } else {
            throw DataError.itemNotFound
        }
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
    
    func downloadWithEscaping() {
        dataService.downloadItemsWithEscaping { items in
            self.dataArray = items
        }
    }
    
    func downloadWithCombine() {
        dataService.downloadItemsWithCombine()
            .sink { _ in
                
            } receiveValue: { items in
                self.dataArray = items
            }
            .store(in: &cancellables)
    }
    
}
