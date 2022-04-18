//
//  Answer.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import Foundation


struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
