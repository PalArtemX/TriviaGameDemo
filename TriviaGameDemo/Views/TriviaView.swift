//
//  TriviaView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaVM: TriviaViewModel
    
    var body: some View {
        if triviaVM.reachedEnd {
            VStack(spacing: 20.0) {
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game! 🤩")
                
                Text("You scored \(triviaVM.score) out of \(triviaVM.length)")
                    .font(.headline)
                
                PrimaryButtonView(text: "Play again", color: .accentColor, systemName: "arrowtriangle.right.circle.fill") {
                    withAnimation(.default) {
                        triviaVM.fetchTrivia()
                    }
                }
            }
            .foregroundColor(.accentColor)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.colorTheme.background)
        } else {
            QuestionView()
        }
        
    }
}










struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaViewModel())
    }
}
