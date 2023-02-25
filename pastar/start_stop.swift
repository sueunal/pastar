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
    var body: some View {
        VStack{
                    Spacer()
                    HStack{
                        Button {
                            pastarButton.toggle()
                            if pastarButton {
                            }
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
