//
//  Text.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import Foundation
import SwiftUI


extension Text {
    func lilacTitle() -> some View {
        self
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.accentColor)
    }
}
