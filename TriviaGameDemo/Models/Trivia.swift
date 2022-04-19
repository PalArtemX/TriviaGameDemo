//
//  Trivia.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import Foundation


struct Trivia: Codable {
    let responseCode: Int
    let results: [Result]
    
    // MARK:  Result
    struct Result: Codable, Identifiable {
        var id: UUID {
            UUID()
        }
        let category: String
        let type: GameType
        let difficulty: Difficulty
        let question: String
        let correctAnswer: String
        let incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
               return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrect = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers: [Answer] = correct + incorrect
                
                return allAnswers.shuffled()
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
    // MARK:  Difficulty
    enum Difficulty: String ,Codable {
        case easy
        case hard
        case medium
    }
    // MARK:  Level
    enum GameType: String, Codable {
        case boolean
        case multiple
    }
}




