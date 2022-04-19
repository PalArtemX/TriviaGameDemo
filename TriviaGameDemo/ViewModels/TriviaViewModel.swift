//
//  TriviaViewModel.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 19/04/2022.
//

import Foundation
import Combine
import SwiftUI



class TriviaViewModel: ObservableObject {
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.0
    @Published private(set) var score = 0
    
    private(set) var trivia: [Trivia.Result] = []
    var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    init() {
        fetchTrivia()
    }
    
    
    // MARK: - Functions
    
    // MARK: fetchTrivia
    func fetchTrivia() {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10") else {
            print("Error URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let decoder = JSONDecoder()
        // MARK: converts to camel case
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { output -> Data in
                guard
                    let response = output.response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: Trivia.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Completion finish")
                case .failure(let error):
                    print("Error completion: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedTrivia in
                self?.trivia = returnedTrivia.results
                self?.length = self?.trivia.count ?? 0
                self?.setQuestion()
            }
            .store(in: &cancellable)
    }
    
    // MARK: goToNextQuestion
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    // MARK: setQuestion
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length * 350))
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            question = currentTriviaQuestion.formattedQuestion
            answerChoices  = currentTriviaQuestion.answers
        }
    }
    
    // MARK: selectAnswer
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}
