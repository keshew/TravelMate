import SwiftUI

struct Filter: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var isSelected = false
}

import Foundation

struct PlaceModel: Identifiable, Codable, Hashable {
    var id = UUID()
    var imageName: String
    var miniImage: String
    var type: String
    var isFavorite: Bool
    var name: String
    var rating: Double
    var starsLit: Int
    var descriptionFull: String
    var descriptionShort: String
    var features: [String:String]
    var priceCurrent: Double
    var priceOld: Double?
    var aboutPlace: String
    var discountAmount: Double?
    var hasDiscount: Bool {
        discountAmount != nil && discountAmount! > 0
    }
    var address: String
    var typeInfo: String
    var amenities: [Amenity]
    var reviewsCount: Int
    var ratingThree: Int
    var ratingFour: Int
    var ratingFive: Int
    var additionalImages: [String]
}

struct MateDiscoverView: View {
    @StateObject var mateDiscoverModel =  MateDiscoverViewModel()
    @State var firstFilter = [Filter(image: "fil1", name: "Pool"),Filter(image: "fil2", name: "Spa"),Filter(image: "fil3", name: "Restaurant")]
    @State var secondFilter = [Filter(image: "fil4", name: "Casino"),Filter(image: "fil5", name: "Parking"),Filter(image: "fil6", name: "Gym")]
    @StateObject var bookingStore = BookingStore()
    @State var place = [
        PlaceModel(
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
        ),
        PlaceModel(
            imageName: "discovery2",
            miniImage: "luxury",
            type: "Luxury",
            isFavorite: false,
            name: "Skyline Elite Tower",
            rating: 4.8,
            starsLit: 5,
            descriptionFull: "Premium luxury hotel with panoramic city views, rooftop infinity pool, and Michelin-starred dining.",
            descriptionShort: "Most panoramic views and luxury spa.",
            features: ["fil4":"Casino", "amen1":"Pool", "amen2":"Spa", "amen3":"Restaurant"],
            priceCurrent: 449,
            priceOld: nil,
            aboutPlace: "Find your luxury escape high above the city at Skyline Elite Tower. Enjoy panoramic skyline views, designer rooftop pools, world-class cuisine, and a premium atmosphere for those who crave the extraordinary.",
            discountAmount: nil,
            address: "99 City Tower Ave, Downtown",
            typeInfo: "Luxury Hotel",
            amenities: [
                Amenity(imageName: "amen1", title: "Infinity Pool"),
                Amenity(imageName: "amen3", title: "Rooftop Bar"),
                Amenity(imageName: "fil6", title: "Gym"),
                Amenity(imageName: "amen2", title: "Valet")
            ],
            reviewsCount: 1800,
            ratingThree: 8,
            ratingFour: 21,
            ratingFive: 68,
            additionalImages: ["mrPhts1", "mrPhts2", "mrPhts3", "mrPhts4"]
        ),
        PlaceModel(
            imageName: "discovery3",
            miniImage: "fil4",
            type: "Casino Inside",
            isFavorite: false,
            name: "Lucky Strike Casino Hotel",
            rating: 4.5,
            starsLit: 4,
            descriptionFull: "Entertainment-focused casino hotel with 24/7 gaming, live shows, and multiple dining options.",
            descriptionShort: "Live shows, 24/7 casino, great fun.",
            features: ["fil4":"Casino", "amen1":"Pool", "amen2":"Spa", "amen3":"Restaurant"],
            priceCurrent: 159,
            priceOld: 0,
            aboutPlace: "Lucky Strike is your destination for non-stop excitement! Try your luck in the 24/7 casino, enjoy daily live shows, and recharge with unlimited buffet and bar options in a truly energetic setting.",
            discountAmount: nil,
            address: "222 Fun Lane, City Center",
            typeInfo: "Casino & Hotel",
            amenities: [
                Amenity(imageName: "fil4", title: "Casino"),
                Amenity(imageName: "amen4", title: "Live Shows"),
                Amenity(imageName: "amen3", title: "Bar")
            ],
            reviewsCount: 1400,
            ratingThree: 12,
            ratingFour: 32,
            ratingFive: 52,
            additionalImages: ["mrPhts1", "mrPhts2", "mrPhts3", "mrPhts4"]
        ),
        PlaceModel(
            imageName: "discovery4",
            miniImage: "luxury",
            type: "Near You",
            isFavorite: false,
            name: "Metro Boutique Hotel",
            rating: 4.2,
            starsLit: 4,
            descriptionFull: "Modern boutique hotel in the heart of downtown. Walking distance to attractions and nightlife.",
            descriptionShort: "Boutique style, central location.",
            features: ["fil4":"Casino", "amen1":"Pool", "amen2":"Spa", "amen3":"Restaurant"],
            priceCurrent: 129,
            priceOld: nil,
            aboutPlace: "Metro Boutique Hotel blends modern design with city convenience for an urban adventure. Enjoy free WiFi, a cozy café, and secure parking, all steps away from the city’s best entertainment.",
            discountAmount: nil,
            address: "110 Central Ave, Downtown",
            typeInfo: "Boutique Hotel",
            amenities: [
                Amenity(imageName: "amen3", title: "Cafe"),
                Amenity(imageName: "fil5", title: "Parking")
            ],
            reviewsCount: 1050,
            ratingThree: 27,
            ratingFour: 55,
            ratingFive: 15,
            additionalImages: ["mrPhts1", "mrPhts2", "mrPhts3", "mrPhts4"]
        ),
        PlaceModel(
            imageName: "discovery5",
            miniImage: "luxury",
            type: "Casino, Luxury",
            isFavorite: false,
            name: "Grand Royale",
            rating: 4.7,
            starsLit: 5,
            descriptionFull: "Iconic luxury casino resort featuring high-limit gaming, world-class spa, and celebrity chef restaurants.",
            descriptionShort: "Casino luxury at its finest.",
            features: ["fil4":"Casino", "amen1":"Pool", "amen2":"Spa", "amen3":"Restaurant"],
            priceCurrent: 389,
            priceOld: nil,
            aboutPlace: "Grand Royale sets the standard for opulence. Indulge in high-limit gaming, relax in the world-class spa, and dine where celebrity chefs create once-in-a-lifetime experiences.",
            discountAmount: nil,
            address: "888 Royale Blvd, Entertainment Quarter",
            typeInfo: "Casino Resort",
            amenities: [
                Amenity(imageName: "fil4", title: "High-Limit"),
                Amenity(imageName: "amen2", title: "World-Class Spa"),
                Amenity(imageName: "amen3", title: "Celebrity Chef"),
                Amenity(imageName: "amen1", title: "Pool Complex")
            ],
            reviewsCount: 1780,
            ratingThree: 6,
            ratingFour: 28,
            ratingFive: 62,
            additionalImages: ["mrPhts1", "mrPhts2", "mrPhts3", "mrPhts4"]
        )
    ]
    @State var isBook = false
    @State var selectedPlace = PlaceModel(
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
    )
    @State private var savedModels: [String] = []
    @State var isReview = false
    @State var showAlert = false
    var filteredPlaces: [PlaceModel] {
        let selectedFilterNames = (firstFilter + secondFilter)
            .filter { $0.isSelected }
            .map { $0.name.lowercased() }
        
        if selectedFilterNames.isEmpty {
            return place
        } else {
            return place.filter { placeItem in
                let featuresMatch = placeItem.features.values.contains { feature in
                    selectedFilterNames.contains(feature.lowercased())
                }
                let amenitiesMatch = placeItem.amenities.contains { amenity in
                    selectedFilterNames.contains(amenity.title.lowercased())
                }
                return featuresMatch || amenitiesMatch
            }
        }
    }
    
    let gradients: [LinearGradient] = [
        LinearGradient(
            colors: [Color(red: 234/255, green: 180/255, blue: 5/255), Color(red: 249/255, green: 115/255, blue: 23/255)],
            startPoint: .leading,
            endPoint: .trailing),
        LinearGradient(
            colors: [Color(red: 0/255, green: 255/255, blue: 255/255), Color(red: 0/255, green: 128/255, blue: 255/255)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing),
        LinearGradient(
            colors: [Color(red: 163/255, green: 0/255, blue: 76/255), Color(red: 15/255, green: 78/255, blue: 99/255)],
            startPoint: .top,
            endPoint: .bottom),
        LinearGradient(
            colors: [Color(red: 89/255, green: 22/255, blue: 139/255), Color(red: 20/255, green: 11/255, blue: 47/255)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing),
        LinearGradient(
            colors: [Color(red: 255/255, green: 0/255, blue: 0/255), Color(red: 255/255, green: 225/255, blue: 2/255)],
            startPoint: .leading,
            endPoint: .trailing)
    ]
    
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
                    Image(.discover)
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Text("TravelMate")
                        .FontBold(size: 20)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Amenities")
                            .FontRegular(size: 14)
                        
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(firstFilter, id: \.id) { item in
                                        Button(action: {
                                            if let index = firstFilter.firstIndex(where: { $0.id == item.id }) {
                                                withAnimation {
                                                    firstFilter[index].isSelected.toggle()
                                                }
                                            }
                                        }) {
                                            HStack(spacing: 8) {
                                                Image(item.image)
                                                    .resizable()
                                                    .frame(width: item.image == "fil3" ? 11 : 14, height: 16)
                                                
                                                Text(item.name)
                                                    .FontRegular(size: 14)
                                            }
                                            .padding(EdgeInsets(top: 6, leading: 13, bottom: 5, trailing: 13))
                                            .background {
                                                ZStack {
                                                    Rectangle()
                                                        .fill(item.isSelected ? Color(red: 21/255, green: 44/255, blue: 88/255) : Color(red: 35/255, green: 45/255, blue: 70/255))
                                                        .cornerRadius(20)
                                                    
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(item.isSelected ? Color(red: 32/255, green: 70/255, blue: 135/255) : Color(red: 79/255, green: 87/255, blue: 108/255))
                                                }
                                            }
                                            .padding(1)
                                        }
                                    }
                                }
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(secondFilter, id: \.id) { item in
                                        Button(action: {
                                            if let index = secondFilter.firstIndex(where: { $0.id == item.id }) {
                                                withAnimation {
                                                    secondFilter[index].isSelected.toggle()
                                                }
                                            }
                                        }) {
                                            HStack(spacing: 8) {
                                                Image(item.image)
                                                    .resizable()
                                                    .frame(width: item.image == "fil5" ? 11 : 14, height: 16)
                                                
                                                Text(item.name)
                                                    .FontRegular(size: 14)
                                            }
                                            .padding(EdgeInsets(top: 6, leading: 13, bottom: 5, trailing: 13))
                                            .background {
                                                ZStack {
                                                    Rectangle()
                                                        .fill(item.isSelected ? Color(red: 21/255, green: 44/255, blue: 88/255) : Color(red: 35/255, green: 45/255, blue: 70/255))
                                                        .cornerRadius(20)
                                                    
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(item.isSelected ? Color(red: 32/255, green: 70/255, blue: 135/255) : Color(red: 79/255, green: 87/255, blue: 108/255))
                                                }
                                            }
                                            .padding(1)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16) {
                            ForEach(Array(filteredPlaces.enumerated()), id: \.element.id) { index, item in
                                
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 38/255, green: 46/255, blue: 65/255), lineWidth: 3)
                                                .overlay {
                                                    VStack(alignment: .leading, spacing: 18) {
                                                        Spacer()
                                                        
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            HStack {
                                                                Text(item.name)
                                                                    .FontSemiBold(size: 18)
                                                                
                                                                Spacer ()
                                                                
                                                                Button(action: {
                                                                    if !savedModels.contains(item.name) {
                                                                        selectedPlace = item
                                                                        isReview = true
                                                                    } else {
                                                                        showAlert = true
                                                                    }
                                                                }) {
                                                                    HStack {
                                                                        HStack(spacing: 2) {
                                                                            ForEach(0..<5, id: \.self) { star in
                                                                                Image(systemName: "star.fill")
                                                                                    .resizable()
                                                                                    .frame(width: 15, height: 15)
                                                                                    .foregroundStyle(
                                                                                        star < item.starsLit ?
                                                                                        Color(red: 250/255, green: 204/255, blue: 23/255) :
                                                                                            Color(red: 38/255, green: 46/255, blue: 65/255)
                                                                                    )
                                                                            }
                                                                        }
                                                                        Text(String(format: "%.1f", item.rating))
                                                                            .FontRegular(size: 14)
                                                                    }
                                                                }
                                                                .alert("Fail", isPresented: $showAlert) {
                                                                    Button("OK") {
                                                                        
                                                                    }
                                                                } message: {
                                                                    Text("You have already written a review")
                                                                }
                                                            }
                                                            
                                                            Text(item.descriptionFull)
                                                                .FontRegular(size: 14)
                                                        }
                                                        .padding(.horizontal)
                                                        
                                                        VStack(alignment: .leading, spacing: 12) {
                                                            HStack(spacing: 12) {
                                                                ForEach(Array(item.features.keys.prefix(4)), id: \.self) { featureKey in
                                                                    HStack(spacing: 4) {
                                                                        Image(featureKey)
                                                                            .resizable()
                                                                            .frame(width: 15, height: 16)
                                                                        Text(item.features[featureKey] ?? "")
                                                                            .FontRegular(size: 12)
                                                                    }
                                                                }
                                                            }
                                                            
                                                            HStack {
                                                                Text("$\(Int(item.priceCurrent))")
                                                                    .FontBold(size: 20)
                                                                if let oldPrice = item.priceOld, oldPrice > 0 {
                                                                    HStack(spacing: 2) {
                                                                        Text("$\(Int(oldPrice))")
                                                                            .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                            .strikethrough()
                                                                        Text("/night")
                                                                            .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                    }
                                                                }
                                                                Spacer()
                                                                Button(action: {
                                                                    selectedPlace = item
                                                                    isBook = true
                                                                }) {
                                                                    Rectangle()
                                                                        .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                                                                        .overlay {
                                                                            Text("Book Now")
                                                                                .FontMedium(size: 14)
                                                                        }
                                                                        .frame(width: 100, height: 36)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                        .padding(.bottom, 16)
                                                    }
                                                }
                                        }
                                        .frame(height: 364)
                                        .cornerRadius(12)
                                    
                                    Image(item.imageName)
                                        .resizable()
                                        .overlay {
                                            VStack {
                                                HStack {
                                                    HStack {
                                                        Image(item.miniImage)
                                                            .resizable()
                                                            .frame(width: 15, height: 16)
                                                        Text(item.type)
                                                            .FontMedium(size: 12)
                                                    }
                                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                    .background {
                                                        gradients[index]
                                                    }
                                                    .cornerRadius(8)
                                                    
                                                    Spacer()
                                                    
                                                    ZStack {
                                                        Circle()
                                                            .fill(.black.opacity(0.5))
                                                            .frame(width: 32, height: 32)
                                                        let isFavorite = bookingStore.bookings.contains { $0.place.name == item.name }
                                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                                            .foregroundStyle(isFavorite ? Color(red: 248/255, green: 113/255, blue: 113/255) : .white)
                                                    }
                                                }
                                                
                                                Spacer()
                                                
                                                if let discount = item.discountAmount {
                                                    HStack {
                                                        Text("\(Int(discount))% OFF")
                                                            .FontMedium(size: 12)
                                                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                            .background {
                                                                Color(red: 239/255, green: 68/255, blue: 68/255)
                                                            }
                                                            .cornerRadius(8)
                                                        Spacer()
                                                    }
                                                }
                                            }
                                            .padding(10)
                                        }
                                        .frame(height: 160)
                                        .clipShape(RoundedCornerShape(radius: 12, corners: [.topLeft, .topRight]))
                                }
                                .padding(.horizontal)
                            }
                            
                            Color.clear.frame(height: 60)
                        }
                        .padding(.top, 35)
                    }
                }
            }
        }
        .onAppear {
            loadModelsFromUserDefaults()
        }
        .fullScreenCover(isPresented: $isBook) {
            MateDetailView(model: $selectedPlace)
        }
        .fullScreenCover(isPresented: $isReview) {
            MateReviewView(model: $selectedPlace)
        }
    }
    
    func loadModelsFromUserDefaults() {
        savedModels = UserDefaults.standard.stringArray(forKey: "savedModels") ?? []
    }
}

#Preview {
    MateDiscoverView()
}

struct RoundedCornerShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = []
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension PlaceModel: Equatable {
    static func ==(lhs: PlaceModel, rhs: PlaceModel) -> Bool {
        lhs.id == rhs.id
    }
}
