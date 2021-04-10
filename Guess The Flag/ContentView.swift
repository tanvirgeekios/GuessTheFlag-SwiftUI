//
//  ContentView.swift
//  Guess The Flag
//
//  Created by MD Tanvir Alam on 5/4/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mainVM = MainViewModel()
    var body: some View {
        ZStack(){
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30){
                VStack{
                    Text("Tap the flag of ")
                    Text(mainVM.countries[mainVM.correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        mainVM.flaggedTapped(number: number)
                    }, label: {
                        Image(self.mainVM.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                            .shadow(color:.black,radius:2)
                    })
                }
                Text("Current Score: \(mainVM.currentScore)")
                    .font(.title3)
                    .foregroundColor(.white)
                Spacer()
            }
        }.alert(isPresented: $mainVM.showingScore) {
            Alert(title: Text(mainVM.scoreTitle), message: Text(mainVM.alertMessage), dismissButton: .default(Text("Continue")){
                mainVM.askQuestion()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
