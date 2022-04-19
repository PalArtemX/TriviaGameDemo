//
//  TriviaGameDemoApp.swift
//  TriviaGameDemo
//
//  Created by Artem Paliutin on 18/04/2022.
//

import SwiftUI

@main
struct TriviaGameDemoApp: App {
    
    @StateObject var triviaVM = TriviaViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(triviaVM)
        }
    }
}
