//
//  UnitTestingBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/6/24.
//

import SwiftUI

/*
 1. Unit Tests:
 - test everything except UI "eg. Business Logic in your app"
 
 2. UI Tests
 - tests the UI of your app
 */

struct UnitTestingBootcamp: View {
    
    @StateObject private var vm: UnitTestingBootcamoViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcamoViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

#Preview {
    UnitTestingBootcamp(isPremium: false)
}
