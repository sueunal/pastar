//
//  timerView.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//
import SwiftUI

struct timerView: View {
    @State private var elapsedTime: TimeInterval = 0
    @Binding var pastaButton: Bool
    @Binding var resetButton: Bool
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
                    if pastaButton {
                        timer.upstream.connect().cancel()
                    } else if elapsedTime < duration {
                        elapsedTime += 1
                    }else if pastaButton {
                        timer.upstream.connect().cancel()
                    }else if resetButton {
                        elapsedTime = 0
                        timer.upstream.connect().cancel()
                    }
                }
        }
    }
}


struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        start_stop()
    }
}
