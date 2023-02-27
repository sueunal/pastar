//
//  ContentView.swift
//  pastar
//
//  Created by sueun kim on 2023/02/23.
//
import SwiftUI

struct ContentView: View {
    
    @State var startButton : Bool = true
    var body: some View {
        ZStack{
            Color("backgroundColor").ignoresSafeArea(.all)
            VStack{
                Text("파스타 타이머🍝")
                    .font(.system(size:25))
                    .bold()
                    .padding(.top,60)
                Text("👩🏻‍🍳")
                    .font(.system(size:40))
                    .padding(.top,30)
                start_stop()
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
