//
//  MainViewModel.swift
//  Guess The Flag
//
//  Created by MD Tanvir Alam on 10/4/21.
//

import Foundation

class MainViewModel : ObservableObject{
    @Published var countries = ["Brazil","Canada","Germany","NewZealand"]
    @Published var correctAnswer = Int.random(in: 0...2)
    @Published var showingScore = false
    @Published var scoreTitle = ""
    @Published var currentScore = 0
    @Published var alertMessage = ""
    
    func flaggedTapped(number:Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            currentScore = currentScore + 1
            alertMessage = "Your Score is: \(currentScore)"
        }else{
            scoreTitle = "Wrong"
            alertMessage = "Your tapped flag is \(countries[number])"
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
