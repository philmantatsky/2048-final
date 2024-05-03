//
//  CellView.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/22/24.
//

import SwiftUI

struct CellView: View {
    let number: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(self.colorNumber(number))
                Text(number > 0 ? "\(number)" : "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(minWidth: 70, minHeight: 70)
    }
    func colorNumber (_ number : Int) -> Color {
        switch number {
        case 2: return Color(red: 0.5, green: 0.8, blue: 1.0)
        case 4: return Color(red: 0.2, green: 0.9, blue: 0.9)
        case 8 : return Color(red: 0.0, green: 0.9, blue: 0.7)
        case 16 : return Color(red: 0.0, green: 0.9, blue: 0.5)
        case 32 : return Color(red: 0.9, green: 0.5, blue: 0.9)
        case 64 : return Color(red: 0.9, green: 0.3, blue: 0.9)
        case 128 : return Color(red: 0.7, green: 0.3, blue: 0.9)
        case 256 : return Color(red: 0.5, green: 0.3, blue: 0.9)
        case 512 : return Color(red: 0.2, green: 0.3, blue: 0.9)
        case 1024 : return Color(red: 0.0, green: 0.0, blue: 0.6)
        case 2048 : return Color(red: 0.1, green: 0.4, blue: 0.3)
        case 4096 : return Color(red: 0.9, green: 0.7, blue: 0.0)
        default: return Color.gray
        }
    }
}


#Preview {
    CellView(number: 4096)
}
