//
//  MainView.swift
//  LittleLemon
//
//  Created by Ruslan Kasatkin on 6/27/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var model = Model()
    @State var tabSelection = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "appGreen")
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            // A view of restaurants and his location, each of which can be clicked to navigate to a reservation form for that restaurant
            LocationsView()
                .tag(0)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Locations", systemImage: "fork.knife")
                    }
                }
            // Reservation view shows information about a reservation or that there is no reservation yet
            ReservationView()
                .tag(1)
                .tabItem {
                    if !model.displayingReservationForm {
                        Label("Reservation", systemImage: "square.and.pencil")
                    }
                }
        }
        .accentColor(Color("appYellow"))  // Цвет иконок при выборе
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(named: "appGreen")  // Green TabView background
            UITabBar.appearance().unselectedItemTintColor = UIColor.white       // White color of icons in normal state
        }
        .environmentObject(model)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
