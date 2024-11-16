//
//  RestaurantView.swift
//  LittleLemon
//
//  Created by Ruslan Kasatkin on 6/25/24.
//

import SwiftUI

struct RestaurantView: View {
    var restaurant: Restaurant
    
    var body: some View {
    HStack {
    if let uiImage = UIImage(named: restaurant.imageName) {
        Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
    } else {
        Image(systemName: "photo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .foregroundColor(.gray)
    }
        
        VStack(alignment: .leading) {
            Text(restaurant.city)
                    .font(.headline)
                    .foregroundColor(.appGreen)
            Text("\(restaurant.district) - \(restaurant.phoneNumber)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
        }
    }
        .padding(.vertical, 8)
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: Restaurant(city: "Sample City", district: "Sample District", phoneNumber: "(123) 456-7890", imageName: "las_vegas1"))
    }
}
