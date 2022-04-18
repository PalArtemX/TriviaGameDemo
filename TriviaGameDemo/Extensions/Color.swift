//
//  Color.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import Foundation
import SwiftUI


struct ColorTheme {
    let background = Color("Background")
    let buttonGreen = Color("ButtonGreen")
    let buttonRed = Color("ButtonRed")
}

extension Color {
    static var colorTheme = ColorTheme()
}
