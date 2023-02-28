//
//  JoelTabView.swift
//  PastaTimer
//
//  Created by sueun kim on 2023/02/28.
//
import SwiftUI

struct JoelTabView: View {
    let pastaTypes = ["Capellini", "Spaghetti", "Fettuccine", "Penne", "Fusilli"]
    let times = [2, 10, 7, 4, 3] // in minutes
    
    @State private var selectedPastaIndex = 0
    @State private var timeRemaining = 0
    
    var body: some View {
        VStack {
            Text("\(pastaTypes[selectedPastaIndex]) Cook Time")
                .font(.title)
                .padding()
            
            Text("\(timeRemaining) minutes")
                .font(.title)
                .padding()
            
            HStack {
                ForEach(0..<3) { index in
                    Button(action: {
                        self.selectedPastaIndex = index
                        self.timeRemaining = self.times[index]
                    }) {
                        
                        Text("\(self.pastaTypes[index])")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                    }
                    
                }
            }
            .background(Color.blue)
            .cornerRadius(10)
            HStack {
                ForEach(3..<5) { index in
                    Button(action: {
                        self.selectedPastaIndex = index
                        self.timeRemaining = self.times[index]
                    }) {
                        
                        Text("\(self.pastaTypes[index])")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                    }
                }
            }
            .background(Color.blue)
            .cornerRadius(10)
            
            
            Button(action: {
                // start timer countdown
                // ...
            }) {
                Text("Start Timer")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
            }
            .background(Color.green)
            .cornerRadius(10)
        }
    }
}


//struct JoelTabView: View {
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    let pastaTypes = ["Capellini", "Spaghetti", "Fettuccine", "Penne", "Fusilli"]
//    let times = [2, 10, 7, 4, 3] // in minutes
//
//    @State private var selectedPastaIndex = 0
//    @State private var timeRemaining = 0
//
//
//    let futureData: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
//
//
//    func updateTimeRemaining() {
//        let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureData)
//    }
//
//    func t() {
//    }
//
//    var body: some View {
//        VStack {
//            Text("")
//        }
//    }
//}

struct JoelTabView_Previews: PreviewProvider {
    static var previews: some View {
        JoelTabView()
    }
}
