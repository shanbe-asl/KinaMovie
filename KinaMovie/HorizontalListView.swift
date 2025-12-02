//
//  HorizontalListView.swift
//  KinaMovie
//
//  Created by Fitrat on 12/1/25.
//

import SwiftUI

struct HorizontalListView: View {
    let header: String
    var title = [Constants.testTitleURl,Constants.testTitleURl2, Constants.testTitleUR3]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            
            ScrollView(.horizontal){
                LazyHStack{
                    ForEach(title, id:\.self){title in
                        AsyncImage(url:URL(string: title)){image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 120, height: 200)
                    }
                }
            }
        }
        .frame(height: 250)
        .padding(10)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMoviesString)
}
