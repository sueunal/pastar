//
//  selectPastar.swift
//  pastar
//
//  Created by sueun kim on 2023/02/24.
//

import SwiftUI

struct selectPastar: View {
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
    @State var pastarButton : [pastarSelector] = [.pastar1,.pastar2,.pastar3]
    var body: some View {
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
struct selectPastar_Previews: PreviewProvider {
    static var previews: some View {
        selectPastar()
    }
}
