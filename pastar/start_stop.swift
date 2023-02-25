//
//  start_stop.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//

import SwiftUI

struct start_stop: View {
    @State var pastarButton : Bool = true
    var resetButton : Bool = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let duration: TimeInterval = 15 * 60 // 15 minutes in seconds
    @State private var elapsedTime: TimeInterval = 0
    
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
                    } else {
                        timer.upstream.connect().cancel() // stop the timer
                    }
                }
                .onAppear {
                    elapsedTime = 0
                }
            Spacer()
            HStack{
                Button {
                    pastarButton.toggle()
                } label: {
                    Text(pastarButton ? "Start" : "Stop")
                        .foregroundColor(.white)
                        .font(.system(size:25))
                        .frame(width: 100,height: 50)
                        .background(pastarButton ? Color("startColor") : Color(.red))
                        .cornerRadius(75)
                        .padding(.trailing,25)
                        .bold()
                }
                Button{
                    if resetButton {
                        elapsedTime = 0
                    }
                }label: {
                    Text("Reset")
                        .foregroundColor(.white)
                        .frame(width: 100,height: 50)
                        .background(.orange)
                        .cornerRadius(75)
                        .font(.system(size:25))
                        .padding(.leading,25)
                        .bold()
                }
            }
        }
    }
}

struct start_stop_Previews: PreviewProvider {
    static var previews: some View {
        start_stop()
    }
}
