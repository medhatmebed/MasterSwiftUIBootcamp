//
//  SideMenuRowView.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/18/24.
//

import SwiftUI

struct SideMenuRowView: View {
    
    let option: SideMenuOptionModel
    @Binding var selectedOtion: SideMenuOptionModel?
    
    private var isSelected: Bool {
        selectedOtion == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            Text(option.title)
                .font(.subheadline)
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width: 216, height: 44)
        .background(isSelected ? .blue.opacity(0.15) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    SideMenuRowView(option: .dashboard, selectedOtion: .constant(.dashboard))
}
