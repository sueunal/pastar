//
//  start_stop.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//

import SwiftUI

struct start_stop: View {
    @State private var pastaButton : Bool = true
    @State var resetButton : Bool = false
    @State var duration : TimeInterval = 60 * 10
    
    var body: some View {
        VStack{
            timerView(pastaButton: $pastaButton, resetButton: $resetButton, timeRating:$duration ,duration: duration)
                    HStack{
                        Button {
                            pastaButton.toggle()
                        } label: {
                            Text(pastaButton ? "Start" : "Stop")
                                .foregroundColor(.white)
                                .font(.system(size:25))
                                .frame(width: 100,height: 50)
                                .background(pastaButton ? Color("startColor") : Color(.red))
                                .cornerRadius(75)
                                .padding(.trailing,25)
                                .bold()
                        }
                        Button{
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
