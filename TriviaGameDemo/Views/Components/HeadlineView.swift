//
//  HeadlineView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct HeadlineView: View {
    var body: some View {
        // MARK: - Headline
        VStack {
            Text("Trivia Game")
                .lilacTitle()
            Text("Are you ready to test out your trivia skills?")
                .font(.headline)
                .fontWeight(.light)
        }
        .foregroundColor(.accentColor)
    }
}










struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeadlineView()
                .previewLayout(.sizeThatFits)
            HeadlineView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
        .background(Color.colorTheme.background)
    }
}
