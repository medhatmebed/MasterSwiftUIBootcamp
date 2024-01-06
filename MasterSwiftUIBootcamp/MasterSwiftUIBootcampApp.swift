//
//  MasterSwiftUIBootcampApp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/3/24.
//

import SwiftUI

@main
struct MasterSwiftUIBootcampApp: App {
    var body: some Scene {
        WindowGroup {
            let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
            DependencyInjectionBootcamp(dataService: dataService)
        }
    }
}
