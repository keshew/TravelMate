import SwiftUI

struct MateBookHotelView: View {
    @StateObject var mateBookHotelModel =  MateBookHotelViewModel()
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    @State var date = Date()
    @State var secondDate = Date()
    @Binding var model: PlaceModel
    @State var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    @StateObject var bookingStore = BookingStore()
    
    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && !phone.isEmpty
    }
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color(red: 12/255, green: 22/255, blue: 49/255).ignoresSafeArea()
                
                Color(red: 31/255, green: 58/255, blue: 138/255)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 55)
            }
            
            VStack {
                HStack(spacing: 12) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 17)
                    }
                    
                    Text("Book Hotel")
                        .FontBold(size: 20)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                VStack(spacing: -10) {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color(red: 31/255, green: 58/255, blue: 138/255).opacity(0.3))
                            .overlay {
                                HStack(spacing: 12) {
                                    Image(model.imageName)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(12)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(model.name)
                                            .FontSemiBold(size: 18)
                                        
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                .frame(width: 14, height: 14)
                                            
                                            Text(String(format: "%.1f", model.rating) + " (\(model.reviewsCount) reviews)")
                                                .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                        }
                                        
                                        Text(String(format: "$%.0f/night", model.priceCurrent))
                                            .FontSemiBold(size: 16, color: Color(red: 59/255, green: 130/255, blue: 246/255))
                                        
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 105)
                        
                        Rectangle()
                            .fill(Color(red: 41/255, green: 56/255, blue: 95/255))
                            .frame(height: 1)
                    }
                    .offset(y: -10)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 24) {
                            Rectangle()
                                .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                        .overlay {
                                            VStack(spacing: 16) {
                                                HStack(spacing: 8) {
                                                    Image(.person)
                                                        .resizable()
                                                        .frame(width: 16, height: 18)
                                                    
                                                    Text("Guest Information")
                                                        .FontSemiBold(size: 18)
                                                    Spacer()
                                                }
                                                
                                                VStack(spacing: 16) {
                                                    VStack(alignment: .leading) {
                                                        Text("Full Name")
                                                            .FontMedium(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                        
                                                        CustomTextFiled(text: $name, placeholder: "Enter your name")
                                                    }
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text("Email")
                                                            .FontMedium(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                        
                                                        CustomTextFiled(text: $email, placeholder: "Enter your e-mail")
                                                    }
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text("Phone Number")
                                                            .FontMedium(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                        
                                                        CustomTextFiled(text: $phone, placeholder: "Enter your phone number")
                                                    }
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 344)
                                .cornerRadius(12)
                                .padding(.horizontal)
                            
                            Rectangle()
                                .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                        .overlay {
                                            VStack(spacing: 16) {
                                                HStack(spacing: 8) {
                                                    Image(.book)
                                                        .resizable()
                                                        .frame(width: 16, height: 18)
                                                    
                                                    Text("Booking Details")
                                                        .FontSemiBold(size: 18)
                                                    Spacer()
                                                }
                                                
                                                VStack(spacing: 16) {
                                                    HStack(spacing: 20) {
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            Text("Check-in")
                                                                .FontMedium(size: 14)
                                                            
                                                            ZStack {
                                                                HStack {
                                                                    Text(formattedDate(date))
                                                                        .FontRegular(size: 16)
                                                                        .foregroundColor(.white)
                                                                    Spacer()
                                                                    Image("calendar")
                                                                        .resizable()
                                                                        .frame(width: 12, height: 14)
                                                                }
                                                                .padding()
                                                                .background {
                                                                    Rectangle()
                                                                        .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                                                                        .overlay {
                                                                            RoundedRectangle(cornerRadius: 10)
                                                                                .stroke(Color(red: 82/255, green: 88/255, blue: 104/255), lineWidth: 3)
                                                                        }
                                                                    
                                                                }
                                                                .cornerRadius(10)
                                                                
                                                                DatePicker(
                                                                    "",
                                                                    selection: $date,
                                                                    displayedComponents: [.date]
                                                                )
                                                                .datePickerStyle(.compact)
                                                                .opacity(0.1)
                                                                .blur(radius: 15)
                                                            }
                                                            .labelsHidden()
                                                            
                                                            
                                                        }
                                                        
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            Text("Check-out")
                                                                .FontMedium(size: 14)
                                                            
                                                            ZStack {
                                                                HStack {
                                                                    Text(formattedDate(secondDate))
                                                                        .FontRegular(size: 16)
                                                                        .foregroundColor(.white)
                                                                    Spacer()
                                                                    Image("calendar")
                                                                        .resizable()
                                                                        .frame(width: 12, height: 14)
                                                                }
                                                                .padding()
                                                                .background {
                                                                    Rectangle()
                                                                        .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                                                                        .overlay {
                                                                            RoundedRectangle(cornerRadius: 10)
                                                                                .stroke(Color(red: 82/255, green: 88/255, blue: 104/255), lineWidth: 3)
                                                                        }
                                                                    
                                                                }
                                                                .cornerRadius(10)
                                                                
                                                                DatePicker(
                                                                    "",
                                                                    selection: $secondDate,
                                                                    in: date...,
                                                                    displayedComponents: [.date]
                                                                )
                                                                .datePickerStyle(.compact)
                                                                .opacity(0.1)
                                                                .blur(radius: 15)
                                                            }
                                                            .labelsHidden()
                                                        }
                                                    }
                                                    
                                                    HStack(spacing: 20) {
                                                        GuestsPickerView()
                                                        
                                                        RoomPickerView()
                                                    }
                                                    
                                                    RoomTypePickerView()
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 344)
                                .cornerRadius(12)
                                .padding(.horizontal)
                            
                            Button(action: {
                                if isFormValid {
                                    bookingStore.addBooking(place: model, date: date) // сохраняем через объект
                                    showAlert = true
                                }
                            }) {
                                Rectangle()
                                    .fill(isFormValid ? Color(red: 59/255, green: 130/255, blue: 246/255) : Color(red: 75/255, green: 85/255, blue: 99/255))
                                    .overlay {
                                        HStack {
                                            Image(.confirmBooking)
                                                .resizable()
                                                .frame(width: 16, height: 16)
                                            
                                            Text("Confirm Booking")
                                                .FontSemiBold(size: 16)
                                        }
                                    }
                                    .frame(height: 48)
                                    .cornerRadius(12)
                            }
                            .padding(.horizontal)
                            .disabled(!isFormValid)
                            .alert("Booking Confirmed", isPresented: $showAlert) {
                                Button("OK") {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } message: {
                                Text("Your booking has been saved successfully.")
                            }
                            
                            Color.clear.frame(height: 20)
                        }
                        .padding(.top, 20)
                    }
                }
            }
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}

struct Booking: Codable, Identifiable, Hashable {
    var id = UUID()
    let place: PlaceModel
    let date: Date
}

class BookingStore: ObservableObject {
    @Published var bookings: [Booking] = []
    private let defaultsKey = "bookings"

    init() {
        load()
    }

    func addBooking(place: PlaceModel, date: Date) {
        let booking = Booking(place: place, date: date)
        bookings.append(booking)
        save()
    }
    
    func removeBooking(_ booking: Booking) {
        bookings.removeAll { $0.id == booking.id }
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(bookings) {
            UserDefaults.standard.set(encoded, forKey: defaultsKey)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: defaultsKey),
           let decoded = try? JSONDecoder().decode([Booking].self, from: data) {
            bookings = decoded
        }
    }
    
    func clearAllBookings() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        bookings.removeAll()
    }

}

struct RoomTypePickerView: View {
    @State private var isExpanded = false
    @State private var selectedRoomType = "Deluxe Room - $189/night"
    
    // Пример вариантов выбора
    let roomTypes = [
        "Deluxe Room - $189/night",
        "Suite - $249/night"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Rooms Type")
                .FontMedium(size: 14)
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedRoomType)
                        .FontRegular(size: 16)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 17, height: 10)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundStyle(.white)
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 82/255, green: 88/255, blue: 104/255), lineWidth: 3)
                        )
                )
                .cornerRadius(10)
            }
            .overlay(
                VStack(alignment: .leading, spacing: 0) {
                    if isExpanded {
                        VStack(alignment: .leading, spacing: 0) {
                            ForEach(roomTypes, id: \.self) { type in
                                Button(action: {
                                    withAnimation {
                                        selectedRoomType = type
                                        isExpanded = false
                                    }
                                }) {
                                    Text(type)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal)
                                        .background(selectedRoomType == type ? Color.blue.opacity(0.6) : Color.clear)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .background(Color(red: 38/255, green: 46/255, blue: 66/255))
                        .cornerRadius(10)
                        .padding(.top, 5)
                        .shadow(radius: 5)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .zIndex(1)
                        .offset(x: 0, y: 10)
                    }
                }
                , alignment: .bottomLeading
            )
        }
    }
}


struct RoomPickerView: View {
    @State private var isExpanded = false
    @State private var selectedRooms = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Rooms")
                .FontMedium(size: 14)
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("\(selectedRooms) Room\(selectedRooms > 1 ? "s" : "")")
                        .FontRegular(size: 16)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 17, height: 10)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundStyle(.white)
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 82/255, green: 88/255, blue: 104/255), lineWidth: 3)
                        )
                )
                .cornerRadius(10)
            }
            .overlay(
                VStack(alignment: .leading, spacing: 0) {
                    if isExpanded {
                        VStack(alignment: .leading) {
                            ForEach(1...2, id: \.self) { count in
                                Button(action: {
                                    withAnimation {
                                        selectedRooms = count
                                        isExpanded = false
                                    }
                                }) {
                                    Text("\(count) Room\(count > 1 ? "s" : "   ")")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal)
                                        .background(selectedRooms == count ? Color.blue.opacity(0.6) : Color.clear)
                                        .cornerRadius(6)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .background(Color(red: 38/255, green: 46/255, blue: 66/255))
                        .cornerRadius(10)
                        .padding(.top, 5)
                        .shadow(radius: 5)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .zIndex(1)
                        .offset(x: 0, y: 17)
                    }
                }
                , alignment: .bottomLeading
            )
        }
    }
}


struct GuestsPickerView: View {
    @State private var isExpanded = false
    @State private var selectedGuests = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Guests")
                .FontMedium(size: 14)
            
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text("\(selectedGuests) Guest\(selectedGuests > 1 ? "s" : "")")
                        .FontRegular(size: 16)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .resizable()
                        .frame(width: 17, height: 10)
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundStyle(.white)
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 82/255, green: 88/255, blue: 104/255), lineWidth: 3)
                        )
                )
                .cornerRadius(10)
            }
            .overlay(
                VStack(alignment: .leading, spacing: 0) {
                    if isExpanded {
                        VStack(alignment: .leading) {
                            ForEach(1...2, id: \.self) { count in
                                Button(action: {
                                    withAnimation {
                                        selectedGuests = count
                                        isExpanded = false
                                    }
                                }) {
                                    Text("\(count) Guest\(count > 1 ? "s" : "   ")")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 6)
                                        .padding(.horizontal)
                                        .background(selectedGuests == count ? Color.blue.opacity(0.6) : Color.clear)
                                        .cornerRadius(6)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .background(Color(red: 38/255, green: 46/255, blue: 66/255))
                        .cornerRadius(10)
                        .padding(.top, 5)
                        .shadow(radius: 5)
                        .transition(.opacity.combined(with: .move(edge: .top)))
                        .zIndex(1)
                        .offset(x: 0, y: 17)
                    }
                }
                , alignment: .bottomLeading
            )
        }
    }
}



#Preview {
    MateBookHotelView(model: .constant(PlaceModel(
        imageName: "item1",
        miniImage: "fil4",
        type: "Casino Inside",
        isFavorite: false,
        name: "Golden Palace Resort",
        rating: 4.9,
        starsLit: 5,
        descriptionFull: "Luxury casino resort with world-class gaming, premium spa services, and fine dining restaurants.",
        descriptionShort: "World-class gaming, premium spa, top dining",
        features: ["fil4":"Casino", "amen1":"Pool", "amen2":"Spa", "amen3":"Restaurant"],
        priceCurrent: 289,
        priceOld: 385,
        aboutPlace: "Experience the ultimate gaming destination at Royal Casino Resort. Our world-class casino features the latest slot machines, traditional table games, and exclusive VIP gaming areas. Combined with luxury accommodations, fine dining, and premium entertainment, we offer an unforgettable resort experience.",
        discountAmount: 25,
        address: "456 Casino Boulevard, Entertainment District",
        typeInfo: "Casino Hotel & Resort",
        amenities: [
            Amenity(imageName: "casinoBlue", title: "24/7 Casino"),
            Amenity(imageName: "amen1", title: "Pool"),
            Amenity(imageName: "amen2", title: "Spa"),
            Amenity(imageName: "amen3", title: "Restaurant"),
            Amenity(imageName: "fil5", title: "Parking"),
            Amenity(imageName: "fil6", title: "Gym")
        ],
        reviewsCount: 2156,
        ratingThree: 5,
        ratingFour: 24,
        ratingFive: 68,
        additionalImages: ["mrPhts1", "mrPhts2", "mrPhts3", "mrPhts4"]
    )))
}

struct CustomTextFiled: View {
    @Binding var text: String
    @FocusState var isTextFocused: Bool
    var placeholder: String
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.3), lineWidth: 3)
                }
                .frame(height: 47)
                .cornerRadius(8)
            
            TextField("", text: $text, onEditingChanged: { isEditing in
                if !isEditing {
                    isTextFocused = false
                }
            })
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding(.horizontal, 16)
            .frame(height: 47)
            .font(.custom("Poppins-Regular", size: 15))
            .cornerRadius(9)
            .foregroundStyle(.black)
            .focused($isTextFocused)
            
            if text.isEmpty && !isTextFocused {
                Text(placeholder)
                    .FontRegular(size: 12, color: .gray.opacity(0.4))
                    .frame(height: 47)
                    .padding(.leading, 15)
                    .onTapGesture {
                        isTextFocused = true
                    }
            }
        }
    }
}
