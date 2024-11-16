//
//  RestaurantView.swift
//  LittleLemon
//
//  Created by Ruslan Kasatkin on 6/27/24.
//

import SwiftUI

struct RestaurantView: View {
    private var restaurant: RestaurantLocation

    init(_ restaurant: RestaurantLocation) {
        self.restaurant = restaurant
    }

    var body: some View {
    HStack(alignment: .center, spacing: 10) {

        let city = restaurant.city.lowercased().replacingOccurrences(of: " ", with: "_")
        let imageNames = [city + "1", city]

        let uiImage = imageNames.compactMap { UIImage(named: $0) }.first

        if let image = uiImage {
            Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 3)
        } else {
            Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 3)
                    .foregroundColor(.gray)
        }

        VStack(alignment: .leading, spacing: 3) {
            Text(restaurant.city)
                    .font(.title2)
                    .fontWeight(.semibold)

            HStack {
                Text(restaurant.neighborhood)
                Text("–")
                Text(restaurant.phoneNumber)
            }
                .font(.caption)
                .foregroundColor(.gray)
        }
        Spacer()  // Add Spacer to move content to the left
    }
                .padding(.leading)  // Add left padding if necessary
    }
}

struct Restaurant_Previews: PreviewProvider {
    static var previews: some View {
    let sampleRestaurant = RestaurantLocation(city: "Las Vegas", neighborhood: "Downtown", phoneNumber: "(702) 555-9898")
    RestaurantView(sampleRestaurant)
}
}
