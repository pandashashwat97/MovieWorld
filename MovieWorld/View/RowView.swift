//
//  RowView.swift
//  MovieWorld
//
//  Created by Shashwat Panda on 07/05/24.
//
import SwiftUI

struct RowView: View {
    var imageUrlEndpoint: String = ""
    var title:String = "Hello"
    var releaseDate:String = ""
    var ratings:Int = 0
    var body: some View {
        HStack(alignment: .center){
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w154\(imageUrlEndpoint)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            } placeholder: {
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray)
            }
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .frame(width: 100, height: 100)
            .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color.cyan)
                    .padding(.bottom, 5)
                Text("\(releaseDate)")
                Text("Ratings: \(ratings)%")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "chevron.right")
                .padding(.trailing, 10)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
    }
}

#Preview {
    RowView(imageUrlEndpoint: "")
}
