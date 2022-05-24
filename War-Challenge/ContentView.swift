//
//  ContentView.swift
//  War-Challenge
//
//  Created by Grant Davis on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var playerCard = "card5"
    @State private var cpuCard = "card9"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            VStack {
                
                Spacer()
                Image("logo")
                
                Spacer()
                
                HStack {
                    Spacer()
                    Image(playerCard).padding()
                    Spacer()
                    Image(cpuCard).padding()
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    // Generate a random number from 2 - 14 (inclusive)
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    // Update cards
                    playerCard = "card\(playerRand)"
                    cpuCard = "card\(cpuRand)"
                    
                    // Update score
                    if (playerRand > cpuRand) {
                        playerScore += 1
                    }
                    else if (cpuRand > playerRand){
                        cpuScore += 1
                    }
                    else {
                        playerScore += 1
                        cpuScore += 1
                    }
                }, label: {
                    Image("dealbutton")
                })
                    .padding()
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Player")
                        .foregroundColor(Color.white)
                    Spacer()
                    Text("CPU")
                        .foregroundColor(Color.white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text(String(playerScore))
                        .foregroundColor(Color.white)
                        .padding()
                        .font(.largeTitle)
                    Spacer()
                    Text(String(cpuScore))
                        .foregroundColor(Color.white)
                        .padding()
                        .font(.largeTitle)
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
                .previewDevice("iPhone 11")
    }
}
