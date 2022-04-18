//
//  QuestionView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        ZStack {
            // MARK: Background
            Color.colorTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 35.0) {
                HStack {
                    Text("Trivia Game")
                        .lilacTitle()
                    Spacer()
                    Text("1 out of 10")
                        .foregroundColor(.accentColor)
                        .fontWeight(.heavy)
                }
                
                ProgressBarView(progress: 50)
                
                VStack(alignment: .leading) {
                    Text("Sound can travel through a vacuum.")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.accentColor)
                    
                    AnswerRowView(answer: Answer(text: "False", isCorrect: true))
                    AnswerRowView(answer: Answer(text: "True", isCorrect: false))
                }
                
                PrimaryButtonView(text: "Next", color: .accentColor, systemName: "chevron.forward.square.fill") {
                    
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}










struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
