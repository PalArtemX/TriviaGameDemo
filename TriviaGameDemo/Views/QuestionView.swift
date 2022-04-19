//
//  QuestionView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaVM: TriviaViewModel
    
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
                    Text("\(triviaVM.index + 1) out of \(triviaVM.length)")
                        .foregroundColor(.accentColor)
                        .fontWeight(.heavy)
                }
                
                ProgressBarView(progress: triviaVM.progress)
                
                VStack(alignment: .leading) {
                    Text(triviaVM.question)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.accentColor)
                    
                    ForEach(triviaVM.answerChoices, id: \.id) { answer in
                        AnswerRowView(answer: answer)
                    }
                }
                
                PrimaryButtonView(text: "Next", color: triviaVM.answerSelected ? .accentColor : .gray.opacity(0.5), systemName: "chevron.forward.square.fill") {
                    withAnimation(.default) {
                        triviaVM.goToNextQuestion()
                    }
                }
                .disabled(!triviaVM.answerSelected)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}










struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaViewModel())
    }
}
