//
//  ButtonStyleModifier.swift
//  OpenInApp
//
//  Created by Naveen Katari  on 03/05/24.
//
import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    var isSelected: Bool

    func body(content: Content) -> some View {
        content
            .foregroundColor(isSelected ? .white : .gray)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(height: 40)
            .background(isSelected ? Color.blue : Color.clear)
            .cornerRadius(20)
    }
}
