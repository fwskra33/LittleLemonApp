//
//  LocationsView.swift
//  LittleLemon
//
//  Created by Ruslan Kasatkin on 6/27/24.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
  
    var body: some View {
        VStack {
            // Logo
            LittleLemonLogo()
                .padding(.top, 50)
            // Changing title
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            // List of restaurants
            
            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .listStyle(.plain)
            }
        }
        .padding(.top, -10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

