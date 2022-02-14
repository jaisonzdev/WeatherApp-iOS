//
//  WeatherButton.swift
//  Weather
//
//  Created by Jaison Zachariah on 14/02/22.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .cornerRadius(10.0)
    }
}
