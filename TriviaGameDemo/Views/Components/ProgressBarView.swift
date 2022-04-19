//
//  ProgressBarView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct ProgressBarView: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                //.frame(width: 350, height: 5)
                .frame(maxWidth: 350, maxHeight: 5)
                .foregroundColor(.gray)
                .opacity(0.3)
                .cornerRadius(10)
            
            Rectangle()
                .frame(width: progress, height: 5)
                .foregroundColor(.accentColor)
                .cornerRadius(10)
        }
    }
}










struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressBarView(progress: 100)
                .previewLayout(.sizeThatFits)
            ProgressBarView(progress: 30)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
