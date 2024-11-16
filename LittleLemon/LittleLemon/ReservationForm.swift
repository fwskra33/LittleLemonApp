//
//  ReservationForm.swift
//  LittleLemon
//
//  Created by Ruslan Kasatkin on 6/25/24.
//

import SwiftUI

struct ReservationForm: View {
    var restaurant: Restaurant
    
    @State private var partySize = 1
    @State private var date = Date()
    @State private var time = Date()
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var specialRequest = ""
    @State private var showError = false
    @State private var errorMessage = ""

    var body: some View {
        ScrollView { // Using ScrollView to support scrolling
            VStack(alignment: .leading, spacing: 15) {
                Text("\(restaurant.city)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 8)
                    .foregroundColor(.appGreen)// Add padding at the top

                Text("\(restaurant.district) - \(restaurant.phoneNumber)")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Divider()
                
                HStack {
                    Text("PARTY")
                        .fontWeight(.bold)
                    Spacer()
                    Stepper(value: $partySize, in: 1...20) {
    Text("\(partySize)")
                            .padding(.leading, 20)
                            .foregroundColor(.appGreen) // Change text color
                    }
                }
                
                HStack {
                    Text("DATE")
                        .fontWeight(.bold)
                    Spacer()
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .labelsHidden()
                }
                
                HStack {
                    Text("TIME")
                        .fontWeight(.bold)
                    Spacer()
                    DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                Group {
                    TextField("Your name...", text: $name)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    
                    TextField("Your phone number...", text: $phone)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    
                    TextField("Your e-mail...", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    
                    TextField("add any special request (optional)", text: $specialRequest)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
                
                Button(action: {
                    validateForm()
                }) {
                    Text("CONFIRM RESERVATION")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.appGreen) // Change color to appGreen
                        .foregroundColor(.appYellow) // Change color to appYellow
                        .cornerRadius(50)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Reservation", displayMode: .inline)
            .alert(isPresented: $showError) {
                Alert(title: Text("ERROR"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
}
        }
    }

    private func validateForm() {
        var errors = [String]()
        
        if name.isEmpty || !name.allSatisfy({ $0.isLetter }) || name.count < 3 {
            errors.append("Names can only contain letters and must have at least 3 characters.")
        }
        
        if phone.isEmpty {
    errors.append("The phone number cannot be blank.")
        }
        
        if !isValidEmail(email) {
            errors.append("The e-mail is invalid and cannot be blank.")
}
        
        if !errors.isEmpty {
            errorMessage = errors.joined(separator: "\n")
            showError = true
        } else {
            // Reservation confirmation action
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
    let emailFormat = "^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Z]{2,}$"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
}

struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm(restaurant: Restaurant(city: "Las Vegas", district: "Downtown", phoneNumber: "(702) 555-9898", imageName: "sample_image"))
    }
}
