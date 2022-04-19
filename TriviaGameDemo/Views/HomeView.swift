//
//  HomeView.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var isActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - Background
                Color.colorTheme.background
                    .ignoresSafeArea()
                
                VStack(spacing: 50.0) {
                    Spacer()
                    HeadlineView()
                    
                    Spacer()
                    
                    NavigationLink(isActive: $isActive) {
                        TriviaView()
                            .environmentObject(TriviaViewModel())
                    } label: {
                        PrimaryButtonView(text: "Let's Go!",color: .accentColor, systemName: "circle.square") {
                            withAnimation(.default) {
                                isActive.toggle()
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
