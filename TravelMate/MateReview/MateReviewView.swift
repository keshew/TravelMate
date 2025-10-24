import SwiftUI

struct ReviewModel:  Identifiable {
    var id = UUID()
    var text: String
    var isSelected = false
}

struct MateReviewView: View {
    @StateObject var mateReviewModel =  MateReviewViewModel()
    @State var text = ""
    @Binding var model: PlaceModel
    @State var first = [ReviewModel(text: "Great service"), ReviewModel(text: "Clean rooms")]
    @State var second = [ReviewModel(text: "Good location"), ReviewModel(text: "Value for money")]
    @State var third = [ReviewModel(text: "Comfortable beds")]
    @State private var savedModels: [String] = []
    @State private var showAlert = false
    @Environment(\.presentationMode) var presentationMode
    @State private var rating = 0
    @State private var rating2 = 0
    @State private var rating3 = 0
    @State private var rating4 = 0
    @State private var rating5 = 0
    @State var showAlertSuc = false
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
                        NotificationCenter.default.post(name: Notification.Name("UserResourcesUpdated"), object: nil)
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 17)
                    }
                    
                    Text("Add Review")
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
                                        
                                        Text(model.type)
                                            .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                        
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                .frame(width: 14, height: 14)
                                            
                                            Text(String(format: "%.1f", model.rating))
                                                .FontSemiBold(size: 16)
                                            
                                            Text("\(model.reviewsCount) reviews")
                                                .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                        }
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
                            VStack(spacing: 16) {
                                HStack {
                                    Text("How was your experience?")
                                        .FontSemiBold(size: 18)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                
                                HStack(spacing: 8) {
                                    ForEach(0..<5, id: \.self) { index in
                                        Button(action: {
                                            rating = index + 1
                                        }) {
                                            ZStack {
                                                Circle()
                                                    .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                                    .frame(width: 48, height: 48)
                                                
                                                Circle()
                                                    .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                                    .frame(width: 47, height: 47)
                                                
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 27, height: 24)
                                                    .foregroundStyle(
                                                                      index < rating ?
                                                                      Color(red: 250/255, green: 204/255, blue: 23/255) :
                                                                      Color(red: 156/255, green: 163/255, blue: 175/255)
                                                                  )
                                            }
                                        }
                                    }
                                }
                                
                                Text("Tap to rate")
                                    .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                            }
                            
                            VStack(spacing: 16) {
                                HStack {
                                    Text("Tell us more")
                                        .FontSemiBold(size: 18)
                                        .padding(.leading)
                                    
                                    Spacer()
                                }
                                
                                Rectangle()
                                    .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                            .overlay {
                                                CustomTextView(text: $text, placeholder: "Share your expereneice with other\ntravelers")
                                            }
                                    }
                                    .frame(height: 128)
                                    .cornerRadius(12)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 12) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            ForEach(first, id: \.id) { item in
                                                Button(action: {
                                                    if let index = first.firstIndex(where: { $0.id == item.id }) {
                                                        withAnimation {
                                                            first[index].isSelected.toggle()
                                                        }
                                                    }
                                                }) {
                                                    HStack(spacing: 8) {
                                                        Text(item.text)
                                                            .FontRegular(size: 14)
                                                    }
                                                    .padding(EdgeInsets(top: 6, leading: 13, bottom: 5, trailing: 13))
                                                    .background {
                                                        ZStack {
                                                            Rectangle()
                                                                .fill(item.isSelected ? Color(red: 21/255, green: 44/255, blue: 88/255) : Color(red: 14/255, green: 23/255, blue: 45/255))
                                                                .cornerRadius(20)
                                                            
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(item.isSelected ? Color(red: 32/255, green: 70/255, blue: 135/255) : Color(red: 79/255, green: 87/255, blue: 108/255))
                                                        }
                                                    }
                                                    .padding(1)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            ForEach(second, id: \.id) { item in
                                                Button(action: {
                                                    if let index = second.firstIndex(where: { $0.id == item.id }) {
                                                        withAnimation {
                                                            second[index].isSelected.toggle()
                                                        }
                                                    }
                                                }) {
                                                    HStack(spacing: 8) {
                                                        Text(item.text)
                                                            .FontRegular(size: 14)
                                                    }
                                                    .padding(EdgeInsets(top: 6, leading: 13, bottom: 5, trailing: 13))
                                                    .background {
                                                        ZStack {
                                                            Rectangle()
                                                                .fill(item.isSelected ? Color(red: 21/255, green: 44/255, blue: 88/255) : Color(red: 14/255, green: 23/255, blue: 45/255))
                                                                .cornerRadius(20)
                                                            
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(item.isSelected ? Color(red: 32/255, green: 70/255, blue: 135/255) : Color(red: 79/255, green: 87/255, blue: 108/255))
                                                        }
                                                    }
                                                    .padding(1)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 8) {
                                            ForEach(third, id: \.id) { item in
                                                Button(action: {
                                                    if let index = third.firstIndex(where: { $0.id == item.id }) {
                                                        withAnimation {
                                                            third[index].isSelected.toggle()
                                                        }
                                                    }
                                                }) {
                                                    HStack(spacing: 8) {
                                                        Text(item.text)
                                                            .FontRegular(size: 14)
                                                    }
                                                    .padding(EdgeInsets(top: 6, leading: 13, bottom: 5, trailing: 13))
                                                    .background {
                                                        ZStack {
                                                            Rectangle()
                                                                .fill(item.isSelected ? Color(red: 21/255, green: 44/255, blue: 88/255) : Color(red: 14/255, green: 23/255, blue: 45/255))
                                                                .cornerRadius(20)
                                                            
                                                            RoundedRectangle(cornerRadius: 20)
                                                                .stroke(item.isSelected ? Color(red: 32/255, green: 70/255, blue: 135/255) : Color(red: 79/255, green: 87/255, blue: 108/255))
                                                        }
                                                    }
                                                    .padding(1)
                                                }
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Rate specific aspects")
                                    .FontSemiBold(size: 18)
                                
                                HStack {
                                    Text("Service")
                                        .FontRegular(size: 16)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 5) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Button(action: {
                                                rating2 = index + 1
                                            }) {
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                                    .foregroundStyle(
                                                                      index < rating2 ?
                                                                      Color(red: 250/255, green: 204/255, blue: 23/255) :
                                                                      Color(red: 156/255, green: 163/255, blue: 175/255)
                                                                  )
                                            }
                                        }
                                    }
                                }
                                
                                HStack {
                                    Text("Cleanliness")
                                        .FontRegular(size: 16)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 5) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Button(action: {
                                                rating3 = index + 1
                                            }) {
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                                    .foregroundStyle(
                                                                      index < rating3 ?
                                                                      Color(red: 250/255, green: 204/255, blue: 23/255) :
                                                                      Color(red: 156/255, green: 163/255, blue: 175/255)
                                                                  )
                                            }
                                        }
                                    }
                                }
                                
                                HStack {
                                    Text("Location")
                                        .FontRegular(size: 16)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 5) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Button(action: {
                                                rating4 = index + 1
                                            }) {
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                                    .foregroundStyle(
                                                                      index < rating4 ?
                                                                      Color(red: 250/255, green: 204/255, blue: 23/255) :
                                                                      Color(red: 156/255, green: 163/255, blue: 175/255)
                                                                  )
                                            }
                                        }
                                    }
                                }
                                
                                HStack {
                                    Text("Value")
                                        .FontRegular(size: 16)
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 5) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Button(action: {
                                                rating5 = index + 1
                                            }) {
                                                Image(systemName: "star.fill")
                                                    .resizable()
                                                    .frame(width: 15, height: 15)
                                                    .foregroundStyle(
                                                                      index < rating5 ?
                                                                      Color(red: 250/255, green: 204/255, blue: 23/255) :
                                                                      Color(red: 156/255, green: 163/255, blue: 175/255)
                                                                  )
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            Button(action: {
                                if rating > 0 {
                                     if !savedModels.contains(model.name) {
                                         savedModels.append(model.name)
                                         addModelToUserDefaults(newModel: model.name)
                                         showAlertSuc = true
                                         NotificationCenter.default.post(name: Notification.Name("UserResourcesUpdated"), object: nil)
                                     }
                                 } else {
                                     showAlert = true
                                 }
                            }) {
                                Rectangle()
                                    .fill(rating > 0 ? Color(red: 59/255, green: 130/255, blue: 246/255) : Color(red: 75/255, green: 85/255, blue: 99/255))
                                    .overlay {
                                        Text("Submit Review")
                                            .FontSemiBold(size: 16)
                                    }
                                    .frame(height: 48)
                                    .cornerRadius(12)
                            }
                            .padding(.horizontal)
                            .alert("Please fill ratings", isPresented: $showAlert) {
                                 Button("OK", role: .cancel) { }
                             }
                            
                            .alert("Successfully saved!", isPresented: $showAlertSuc) {
                                 Button("OK", role: .cancel) { }
                             }
                            Color.clear.frame(height: 20)
                        }
                        .padding(.top, 20)
                    }
                }
            }
        }
    }
    
    func addModelToUserDefaults(newModel: String) {
        var savedModels = UserDefaults.standard.stringArray(forKey: "savedModels") ?? []
        
        savedModels.append(newModel)
        
        UserDefaults.standard.set(savedModels, forKey: "savedModels")
    }


    func loadModelsFromUserDefaults() {
        savedModels = UserDefaults.standard.stringArray(forKey: "savedModels") ?? []
    }
}

#Preview {
    MateReviewView(model: .constant(PlaceModel(
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

struct CustomTextView: View {
    @Binding var text: String
    @FocusState var isTextFocused: Bool
    var placeholder: String
    var height: CGFloat = 120
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.clear)
                .cornerRadius(26)
            
            TextEditor(text: $text)
                .scrollContentBackground(.hidden)
                .padding(.horizontal, 15)
                .padding(.top, 5)
                .frame(height: height)
                .font(.custom("Poppins-Regular", size: 16))
                .focused($isTextFocused)
            
            if text.isEmpty && !isTextFocused {
                VStack {
                    Text(placeholder)
                        .FontRegular(size: 16, color: Color(red: 172/255, green: 174/255, blue: 188/255))
                        .padding(.leading, 15)
                        .padding(.top, 10)
                        .onTapGesture {
                            isTextFocused = true
                        }
                    Spacer()
                }
            }
        }
        .frame(height: height)
    }
}
