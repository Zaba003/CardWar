//
//  ContentView.swift
//  CardWar
//
//  Created by Кирилл Заборский on 13.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cardOne = "card2"
    @State private var cardTwo = "card2"
    @State private var userScore = 0
    @State private var cpuScore = 0
    @State private var showingAlert = false
    @State private var winAlert = false
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 180.0, height: 100.0)
                }
                Spacer()
                HStack {
                    Spacer()
                    Image(cardOne)
                        .resizable()
                        .frame(width: 124, height: 175)
                    Spacer()
                    Image(cardTwo)
                        .resizable()
                        .frame(width: 124, height: 175)
                    Spacer()
                }
                Spacer()
                HStack {
                    Button(action: {
                        
                        let cardOneRound = Int.random(in: 1...13)
                        let cardTwoRound = Int.random(in: 1...13)
                        
                        cardOne = "card" + String(cardOneRound)
                        cardTwo = "card" + String(cardTwoRound)
                        
                        if cardOneRound > cardTwoRound {
                            userScore += 1
                        }
                        else if cardTwoRound > cardOneRound {
                            cpuScore += 1
                        }
                        else {
                            showingAlert.toggle()
                            userScore = 0
                            cpuScore = 0
                        }
                        
                    }, label: {
                        Text("Battle")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                            .frame(maxWidth: 350.0)
                            .border(Color.white, width: 5)
                    })
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Identical cards!"), message: Text("Try your luck again!"), dismissButton: .default(Text("OK")))
                    }
                }
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("USER")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(userScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
