//
//  PrimaryButtonView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct PrimaryButtonView: View {
    var text: String
    var color: Color = Color.accentColor
    var systemName: String
    var action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: systemName)
                    .symbolRenderingMode(.hierarchical)
                Text(text)
                    .fontWeight(.bold)
            }
            
            .font(.title3)
            .padding(.horizontal)
        }
        .buttonStyle(.bordered)
        .foregroundColor(color)
    }
}










struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButtonView(text: "Plus", systemName: "plus.circle", action: {})
                .previewLayout(.sizeThatFits)
            PrimaryButtonView(text: "Microphone", systemName: "mic", action: {})
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
