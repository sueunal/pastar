//
//  timerView.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//
import SwiftUI
struct timerView: View {
    @State var timer : Int = 15
    @State var startButton : Bool = false
    var body: some View {
        VStack{
            Text(convertSecondToTime(timer:timer))
                .font(.system(size:65))
                .fontDesign(.monospaced)
                .bold()
                .italic()
        }
    }
    func convertSecondToTime(timer : Int)-> String{
        
       return String(format: "%02i:%02i", 15,00)
    }
}


struct timerView_Previews: PreviewProvider {
    static var previews: some View {
        timerView()
    }
}
