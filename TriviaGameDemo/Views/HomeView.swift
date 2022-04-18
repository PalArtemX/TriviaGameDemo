//
//  HomeView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct HomeView: View {

    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.colorTheme.background
                .ignoresSafeArea()
            
            VStack(spacing: 35.0) {
                HeadlineView()
                
                PrimaryButtonView(text: "Let's Go!",color: .accentColor, systemName: "circle.square") {
                    //
                }
            }
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
