//
//  ViewAnalyticsButton.swift
//  OpenInApp
//
//  Created by Naveen Katari  on 03/05/24.
//

import SwiftUI

struct ViewAnalyticsButton: View {
    var body: some View {
        Button("View Analytics") {
            // Action
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.clear)
        .foregroundColor(.black)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

