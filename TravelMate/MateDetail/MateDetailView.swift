import SwiftUI

import SwiftUI

struct Amenity: Identifiable, Codable, Hashable {
    var id = UUID()
    let imageName: String
    let title: String
}

struct MateDetailView: View {
    @State var imageIndex = 0
    @Binding var model: PlaceModel
    @Environment(\.presentationMode) var presentationMode
    @State var isBook = false
    
    var body: some View {
        ZStack {
            Color(red: 12/255, green: 22/255, blue: 49/255).ignoresSafeArea()
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
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        Image(model.imageName)
                            .resizable()
                            .frame(height: 256)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(model.name)
                                .FontBold(size: 24)
                            HStack {
                                HStack(spacing: 5) {
                                    ForEach(0..<5, id: \.self) { index in
                                        Image(systemName: "star.fill")
                                            .resizable()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(index < model.starsLit ? Color(red: 250/255, green: 204/255, blue: 23/255) : Color.gray)
                                    }
                                }
                                Text(String(format: "%.1f", model.rating))
                                    .FontSemiBold(size: 16)
                                Text("(\(model.reviewsCount) reviews)")
                                    .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                            }
                            
                            Group {
                                HStack {
                                    Image("pin")
                                        .resizable()
                                        .frame(width: 10, height: 20)
                                    Text(model.address)
                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                }
                                HStack {
                                    Image("casinoBlue")
                                        .resizable()
                                        .frame(width: 17, height: 20)
                                    
                                    Text(model.typeInfo)
                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                }
                            }
                            
                            Rectangle()
                                .fill(Color(red: 59/255, green: 130/255, blue: 246/255).opacity(0.2))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 32/255, green: 70/255, blue: 135/255), lineWidth: 3)
                                        .overlay {
                                            HStack {
                                                VStack(alignment: .leading, spacing: 5) {
                                                    HStack {
                                                        Text("$\(Int(model.priceCurrent))")
                                                            .FontBold(size: 30)
                                                        Text("/night")
                                                            .FontRegular(
                                                                size: 16,
                                                                color: Color(red: 156/255, green: 163/255, blue: 175/255)
                                                            )
                                                    }
                                                    
                                                    HStack {
                                                        if let discount = model.discountAmount {
                                                            HStack {
                                                                Text("\(Int(discount))% OFF")
                                                                    .FontMedium(size: 12, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                                    .background(Color(red: 33/255, green: 197/255, blue: 93/255).opacity(0.2))
                                                                    .cornerRadius(8)
                                                            }
                                                        }
                                                        if let oldPrice = model.priceOld, oldPrice > 0 {
                                                            Text("$\(Int(oldPrice))")
                                                                .FontRegular(
                                                                    size: 14,
                                                                    color: Color(red: 156/255, green: 163/255, blue: 175/255)
                                                                )
                                                                .strikethrough()
                                                        }
                                                    }
                                                }
                                                
                                                Spacer()
                                                Button(action: {
                                                    isBook = true
                                                }) {
                                                    Text("Book Now")
                                                        .FontSemiBold(size: 14)
                                                        .frame(width: 127, height: 48)
                                                        .background(Color(red: 59/255, green: 130/255, blue: 246/255))
                                                        .cornerRadius(12)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 92)
                                .cornerRadius(12)
                            
                            VStack(alignment: .leading, spacing: 21)  {
                                HStack {
                                    Image(.casinoBlue)
                                        .resizable()
                                        .frame(width: 19, height: 22)
                                    
                                    Text("Information")
                                        .FontSemiBold(size: 18)
                                }
                                
                                VStack(alignment: .leading, spacing: 16) {
                                    Rectangle()
                                        .fill(LinearGradient(colors: [Color(red: 88/255, green: 28/255, blue: 135/255).opacity(0.4),
                                                                      Color(red: 131/255, green: 24/255, blue: 67/255).opacity(0.4)], startPoint: .leading, endPoint: .trailing))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 168/255, green: 85/255, blue: 247/255).opacity(0.2), lineWidth: 3)
                                                .overlay {
                                                    VStack(alignment: .leading, spacing: 12) {
                                                        HStack(spacing: 12) {
                                                            Image(.hours)
                                                                .resizable()
                                                                .frame(width: 16, height: 16)
                                                            
                                                            VStack(alignment: .leading, spacing: 0) {
                                                                Text("Hours")
                                                                    .FontSemiBold(size: 16)
                                                                
                                                                Text("Open 24/7")
                                                                    .FontRegular(size: 14, color: Color(red: 234/255, green: 213/255, blue: 255/255))
                                                            }
                                                            
                                                            Spacer()
                                                            
                                                            Text("Open Now")
                                                                .FontMedium(size: 14, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                                .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
                                                                .background {
                                                                    Color(red: 33/255, green: 197/255, blue: 93/255).opacity(0.2)
                                                                }
                                                                .cornerRadius(16)
                                                        }
                                                        
                                                        Rectangle()
                                                            .fill(Color(red: 63/255, green: 36/255, blue: 106/255))
                                                            .frame(height: 1)
                                                        
                                                        HStack(spacing: 12) {
                                                            Image(.dresscode)
                                                                .resizable()
                                                                .frame(width: 14, height: 16)
                                                            
                                                            VStack(alignment: .leading, spacing: 0) {
                                                                Text("Dress Code")
                                                                    .FontSemiBold(size: 16)
                                                                
                                                                Text("Smart casual required after 6 PM")
                                                                    .FontRegular(size: 14, color: Color(red: 234/255, green: 213/255, blue: 255/255))
                                                            }
                                                            
                                                            Spacer()
                                                        }
                                                        
                                                        HStack(spacing: 12) {
                                                            Image(.validid)
                                                                .resizable()
                                                                .frame(width: 18, height: 16)
                                                            
                                                            VStack(alignment: .leading, spacing: 0) {
                                                                Text("Age Restriction")
                                                                    .FontSemiBold(size: 16)
                                                                
                                                                Text("21+ years old, valid ID required")
                                                                    .FontRegular(size: 14, color: Color(red: 234/255, green: 213/255, blue: 255/255))
                                                            }
                                                            
                                                            Spacer()
                                                        }
                                                    }
                                                    .padding(.horizontal)
                                                }
                                        }
                                        .frame(height: 191)
                                        .cornerRadius(12)
                                }
                            }
                            .padding(.top)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("About this place")
                                    .FontSemiBold(size: 18)
                                Text(model.aboutPlace)
                                    .FontRegular(size: 14)
                            }
                            .padding(.top)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Hotel Amenities")
                                    .FontSemiBold(size: 18)
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                    ForEach(model.amenities) { amenity in
                                        HStack {
                                            Rectangle()
                                                .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                                .frame(height: 48)
                                                .overlay {
                                                    HStack {
                                                        Image(amenity.imageName)
                                                            .resizable()
                                                            .frame(width: 18, height: 18)
                                                        Text(amenity.title)
                                                            .FontMedium(size: 14)
                                                        Spacer()
                                                    }
                                                    .padding(.leading)
                                                }
                                                .cornerRadius(16)
                                        }
                                    }
                                }
                            }
                            .padding(.top, 20)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Reviews")
                                    .FontSemiBold(size: 18)
                                Rectangle()
                                    .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                    .frame(height: 168)
                                    .overlay {
                                        VStack {
                                            HStack(spacing: 12) {
                                                Text(String(format: "%.1f", model.rating))
                                                    .FontBold(size: 30)
                                                VStack(alignment: .leading) {
                                                    HStack(spacing: 5) {
                                                        ForEach(0..<5, id: \.self) { index in
                                                            Image(systemName: "star.fill")
                                                                .resizable()
                                                                .frame(width: 15, height: 15)
                                                                .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                        }
                                                    }
                                                    Text("Based on \(model.reviewsCount) reviews")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                }
                                                Spacer()
                                            }
                                            RatingBar(ratingThree: model.ratingThree, ratingFour: model.ratingFour, ratingFive: model.ratingFive)
                                        }
                                        .padding(.horizontal)
                                    }
                                    .cornerRadius(16)
                            }
                            .padding(.top, 20)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("More photos")
                                    .FontSemiBold(size: 18)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(model.additionalImages, id: \.self) { imgName in
                                            Image(imgName)
                                                .resizable()
                                                .frame(width: 256, height: 129)
                                        }
                                    }
                                    .padding(.bottom)
                                }
                            }
                            .padding(.top, 20)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isBook) {
            MateBookHotelView(model: $model)
        }
    }
}

struct RatingBar: View {
    var ratingThree: Int
    var ratingFour: Int
    var ratingFive: Int
    
    var body: some View {
        VStack(spacing: 12) {
            RatingBarRow(starText: "5★", percentage: ratingFive)
            RatingBarRow(starText: "4★", percentage: ratingFour)
            RatingBarRow(starText: "3★", percentage: ratingThree)
        }
    }
}

struct RatingBarRow: View {
    var starText: String
    var percentage: Int
    
    var body: some View {
        HStack(spacing: 12) {
            Text(starText)
                .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
            Spacer()
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(red: 55/255, green: 65/255, blue: 81/255))
                    .frame(width: 240, height: 8)
                    .cornerRadius(10)
                Rectangle()
                    .fill(Color(red: 250/255, green: 204/255, blue: 23/255))
                    .frame(width: CGFloat(percentage * 240 / 100), height: 8)
                    .cornerRadius(10)
            }
            Text("\(percentage)%")
                .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
        }
    }
}

#Preview {
    MateDetailView(model: .constant(PlaceModel(
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

