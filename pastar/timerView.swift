//
//  timerView.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//
import SwiftUI
struct timerView: View {
    @State private var elapsedTime: TimeInterval = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    let duration: TimeInterval = 15 * 60 // 15 minutes in seconds
    var remainingTime: TimeInterval {
        max(duration - elapsedTime, 0)
    }
    var body: some View {
        VStack{
            Text("\(Int(remainingTime / 60)):\(Int(remainingTime) % 60, specifier: "%02d")")
                .foregroundColor(.black)
                .font(.system(size:65))
                .italic()
                .onReceive(timer) { _ in
                    if elapsedTime < duration {
                        elapsedTime += 1
                    }
                }
        }
    }
}


struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        timerView()
    }
}
