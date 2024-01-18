//
//  SideMenuOptionModel.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/18/24.
//

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case dashboard, performance, profile, search, notifications
    
    var title: String {
        switch self {
        case .dashboard: "Dashboard"
        case .performance: "Performance"
        case .profile: "Profile"
        case .search: "Search"
        case .notifications: "Notification"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .dashboard: "filemenu.and.cursorarrow"
        case .performance: "chart.bar"
        case .profile: "person"
        case .search: "magnifyingglass"
        case .notifications: "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int { self.rawValue }
}
