//
//  AnswerRowView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct AnswerRowView: View {
    @EnvironmentObject var triviaVM: TriviaViewModel
    var answer: Answer
    @State private var isSelected = false
    
    var body: some View {
        Button {
            if !triviaVM.answerSelected {
                isSelected = true
                triviaVM.selectAnswer(answer: answer)
            }
            
        } label: {
            HStack(spacing: 20.0) {
                Image(systemName: isSelected ? "circle.inset.filled" : "circle.circle" )
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.accentColor)

                Text(answer.text)
                    .bold()
                    .foregroundColor(.accentColor)
                
                Spacer()
                if isSelected {
                    Image(systemName: answer.isCorrect ? "checkmark.circle" : "xmark.circle")
                        .symbolRenderingMode(.hierarchical)
                        .font(.title2)
                        .foregroundColor(answer.isCorrect ? .colorTheme.buttonGreen : .colorTheme.buttonRed)
                }
            }
            .padding()
            .foregroundColor(triviaVM.answerSelected ? (isSelected ? .white : .gray) : .accentColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
        }
        .buttonStyle(.bordered)
    }
}










struct AnswerRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AnswerRowView(answer: previewAnswer)
                .environmentObject(TriviaViewModel())
                .previewLayout(.sizeThatFits)
            AnswerRowView(answer: previewAnswer)
                .environmentObject(TriviaViewModel())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
