//
//  RatingsView.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 09/05/24.
//

import SwiftUI

struct RatingsView: View {
    var vm: ViewModel
    var ratingsPercentage: Int
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.black)
                .frame(width: 90, height: 90)
            Circle()
                .rotation(.degrees(270))
                .trim(from: 0.0, to: vm.ratingsDouble(ratings: ratingsPercentage))
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 70, height: 70)
                .foregroundStyle(Color.yellow)
            Text("\(ratingsPercentage)%")
                .foregroundStyle(Color.yellow)
                .bold()
                .font(.system(size: 20))
        }
        .padding(20)
    }
}

#Preview {
    RatingsView(vm: ViewModel(), ratingsPercentage: 65)
}
