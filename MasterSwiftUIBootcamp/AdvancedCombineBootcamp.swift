//
//  AdvancedCombineBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/6/24.
//

import SwiftUI
import Combine


class AdvancedCombineDataService {
    
  //  @Published var basicPublisher = ""
    let currentValuePublisher = CurrentValueSubject<String, Error>("first publish value")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
      //  let items = ["One", "Two", "Three"]
        let items = Array(0..<11)
        for i in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.passThroughPublisher.send(items[i])
              //  self.basicPublisher = items[i]
            }
        }
    }
    
}

class AdvancedCombineViewModel: ObservableObject {
    
    @Published var data = [String]()
    @Published var error = ""
    let dataService = AdvancedCombineDataService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.passThroughPublisher
        // SEQUENCE OPERATIONS
//            .map({ arr in
//                var temp = [String]()
//                for i in arr {
//                    temp.append(i.uppercased())
//                }
//                return temp
//            })
//            .first(where: { int in
//                return int > 4
//            })
           // .first(where: { $0 > 4 })
//            .tryFirst(where: { int in
//                
//                if int == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                return int > 1
//
//            })
            .last()
            .map({String($0)})
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                    print("error : \(error.localizedDescription)")
                    break
                }
            } receiveValue: { [weak self] returnedData in
                self?.data.append(returnedData)
            }
            .store(in: &cancellables)

    }
    
}

struct AdvancedCombineBootcamp: View {
    
    @StateObject private var vm = AdvancedCombineViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.data, id: \.self) {
                    Text($0)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                if !vm.error.isEmpty {
                    Text(vm.error)
                }
            }
        }
            
    }
}

#Preview {
    AdvancedCombineBootcamp()
}
