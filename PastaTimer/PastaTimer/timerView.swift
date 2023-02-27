//
//  timerView.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//
import SwiftUI

struct timerView: View {
    @Binding var pastaButton: Bool
    @Binding var resetButton: Bool
    @Binding var timeRating : TimeInterval
    @State private var elapsedTime: TimeInterval = 0
    @State var pastarButton : [pastarSelector] = [.pastar1,.pastar2,.pastar3]
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let duration: TimeInterval
    var remainingTime: TimeInterval {
        max(duration - elapsedTime, 0)
    }
    enum pastarSelector {
        case pastar1, pastar2, pastar3
        var pastarName : String {
            switch self {
            case .pastar1:
                return "pastar1"
            case .pastar2:
                return "pastar2"
            case .pastar3:
                return "pastar3"
            }
        }
        var pastarColor : Color {
            switch self{
            case .pastar1:
                return Color("pastar1Color")
            case .pastar2:
                return Color("pastar2Color")
            case .pastar3:
                return Color("pastar3Color")
            }
        }
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
                        }else if elapsedTime < duration {
                            elapsedTime += 1
                        }else if pastaButton {
                            timer.upstream.connect().cancel()
                        }else if resetButton {
                            timer.upstream.connect().cancel()
                        }
                    }
                ZStack{
                    Color(.gray)
                        .frame(width: 300,height: 120)
                        .cornerRadius(40)
                    VStack{
                        Text("면 종류를 선택해 주세요")
                            .padding(.top,50)
                        HStack{
                            ForEach(pastarButton,id:\.self){ pastar in
                                Button {
                                    if pastar.pastarName == "pastar1"{
                                        timeRating = 60 * 10
                                    }
                                    else if pastar.pastarName == "pastar2"{
                                        timeRating = 60 * 15
                                    }else if  pastar.pastarName == "pastar3"{
                                        timeRating = 60 * 8
                                    }
                                } label: {
                                    Text(pastar.pastarName)
                                        .foregroundColor(.black)
                                        .frame(width: 80,height: 30)
                                        .background(pastar.pastarColor)
                                        .cornerRadius(40)
                                        .padding(.bottom,50)
                                }
                            }
                        }
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
