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
                .fill(number == 0 ? Color.gray : Color.orange)
            Text(number > 0 ? "\(number)" : "")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(minWidth: 70, minHeight: 70)
    }
}


#Preview {
    CellView(number: 1)
}
