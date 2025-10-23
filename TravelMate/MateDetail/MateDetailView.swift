import SwiftUI

struct Amenity: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct MateDetailView: View {
    @StateObject var mateDetailModel =  MateDetailViewModel()
    @State var imageIndex = 0
    
    let amenities: [Amenity] = [
        Amenity(imageName: "casinoBlue", title: "24/7 Casino"),
        Amenity(imageName: "amen1", title: "Infinity Pool"),
        Amenity(imageName: "amen2", title: "Luxury Spa"),
        Amenity(imageName: "amen3", title: "Fine Dining"),
        Amenity(imageName: "amen4", title: "Live Shows"),
        Amenity(imageName: "amen5", title: "Fitness Center"),
        Amenity(imageName: "amen6", title: "Premium Bar"),
        Amenity(imageName: "amen7", title: "Concierge")
    ]
    
    let images = ["item1", "item2", "item3"]
    
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
                        ZStack {
                            Image(images[imageIndex])
                                .resizable()
                                .frame(height: 256)
                            
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Button(action: {
                                        if imageIndex > 0 {
                                            imageIndex -= 1
                                        }
                                    }) {
                                        ZStack {
                                            Circle()
                                                .fill(.black.opacity(0.5))
                                                .frame(width: 32, height: 32)
                                            
                                            Image(systemName: "chevron.left")
                                                .foregroundStyle(.white)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        if imageIndex < 2 {
                                            imageIndex += 1
                                        }
                                    }) {
                                        ZStack {
                                            Circle()
                                                .fill(.black.opacity(0.5))
                                                .frame(width: 32, height: 32)
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundStyle(.white)
                                        }
                                    }
                                }
                                
                                Spacer()
                                
                                HStack {
                                    ForEach(0..<3, id: \.self) { index in
                                        Circle()
                                            .fill(imageIndex == index ? .white : .gray)
                                            .frame(width: 8, height: 8)
                                    }
                                }
                                .padding(.bottom)
                            }
                            .padding(.horizontal)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Golden Palace Resort")
                                    .FontBold(size: 24)
                                
                                HStack {
                                    HStack(spacing: 5) {
                                        ForEach(0..<5, id: \.self) { index in
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 15, height: 15)
                                                .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                        }
                                    }
                                    
                                    Text("4.9")
                                        .FontSemiBold(size: 16)
                                    
                                    Text("(2,156 reviews)")
                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack {
                                        Image(.pin)
                                            .resizable()
                                            .frame(width: 10, height: 20)
                                        
                                        Text("456 Casino Boulevard, Entertainment District")
                                            .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                    }
                                    
                                    HStack {
                                        Image(.casinoBlue)
                                            .resizable()
                                            .frame(width: 17, height: 20)
                                        
                                        Text("Casino Hotel & Resort")
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
                                                    VStack(alignment: .leading, spacing: 4) {
                                                        HStack {
                                                            Text("$289")
                                                                .FontBold(size: 30)
                                                            Text("/night")
                                                                .FontRegular(size: 16, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                        }
                                                        
                                                        HStack {
                                                            Text("25% OFF")
                                                                .FontMedium(size: 12, color: Color(red: 74/255, green: 222/255, blue: 129/255))
                                                                .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                                .background {
                                                                    Color(red: 33/255, green: 197/255, blue: 93/255).opacity(0.2)
                                                                }
                                                                .cornerRadius(8)
                                                            
                                                            Text("$385")
                                                                .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                .strikethrough()
                                                        }
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        
                                                    }) {
                                                        Rectangle()
                                                            .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                                                            .overlay {
                                                                Text("Book Now")
                                                                    .FontSemiBold(size: 14)
                                                            }
                                                            .frame(width: 127, height: 48)
                                                            .cornerRadius(12)
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                    }
                                    .frame(height: 98)
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 21)  {
                            HStack {
                                Image(.casinoBlue)
                                    .resizable()
                                    .frame(width: 19, height: 22)
                                
                                Text("Casino Information")
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
                                                            Text("Casino Hours")
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
                                
                                VStack {
                                    HStack(spacing: 12) {
                                        Rectangle()
                                            .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                            .frame(height: 88)
                                            .overlay  {
                                                VStack {
                                                    Image(.slot)
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                    
                                                    Text("150+")
                                                        .FontMedium(size: 14)
                                                    
                                                    Text("Slot Machines")
                                                        .FontRegular(size: 12, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                }
                                            }
                                        
                                        Rectangle()
                                            .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                            .frame(height: 88)
                                            .overlay  {
                                                VStack {
                                                    Image(.tableGames)
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                    
                                                    Text("25+")
                                                        .FontMedium(size: 14)
                                                    
                                                    Text("Table Games")
                                                        .FontRegular(size: 12, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                }
                                            }
                                    }
                                    
                                    HStack(spacing: 12) {
                                        Rectangle()
                                            .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                            .frame(height: 88)
                                            .overlay  {
                                                VStack {
                                                    Image(.dailyTour)
                                                        .resizable()
                                                        .frame(width: 25, height: 23)
                                                    
                                                    Text("Daily")
                                                        .FontMedium(size: 14)
                                                    
                                                    Text("Tournaments")
                                                        .FontRegular(size: 12, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                }
                                            }
                                        
                                        Rectangle()
                                            .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                            .frame(height: 88)
                                            .overlay  {
                                                VStack {
                                                    Image(.vip)
                                                        .resizable()
                                                        .frame(width: 23, height: 20)
                                                    
                                                    Text("VIP")
                                                        .FontMedium(size: 14)
                                                    
                                                    Text("Private Rooms")
                                                        .FontRegular(size: 12, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                }
                                            }
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("About this place")
                                    .FontSemiBold(size: 18)
                                
                                Text("Experience the ultimate gaming destination at Royal Casino Resort. Our world-class casino features the latest slot machines, traditional table games, and exclusive VIP gaming areas. Combined with luxury accommodations, fine dining, and premium entertainment, we offer an unforgettable resort experience.")
                                    .FontRegular(size: 14)
                            }
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Hotel Amenities")
                                    .FontSemiBold(size: 18)
                                
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                    ForEach(amenities) { item in
                                        HStack {
                                            Rectangle()
                                                .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                                .frame(height: 48)
                                                .overlay {
                                                    HStack {
                                                        Image(item.imageName)
                                                            .resizable()
                                                            .frame(width: 18, height: 18)
                                                        
                                                        Text(item.title)
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
                                                Text("4.7")
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
                                                    
                                                    Text("Based on 2,156 reviews")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                }
                                                
                                                Spacer()
                                            }
                                            
                                            VStack {
                                                HStack(spacing: 12) {
                                                    Text("5★")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                    
                                                    Spacer()
                                                    
                                                    ZStack(alignment: .leading) {
                                                        Rectangle()
                                                            .fill(Color(red: 55/255, green: 65/255, blue: 81/255))
                                                            .frame(width: 240, height: 8)
                                                            .cornerRadius(10)
                                                        
                                                        Rectangle()
                                                            .fill(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                            .frame(width: 140, height: 8)
                                                            .cornerRadius(10)
                                                    }
                                                    
                                                    Text("68%")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                }
                                                
                                                HStack(spacing: 12) {
                                                    Text("4★")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                    
                                                    Spacer()
                                                    
                                                    ZStack(alignment: .leading) {
                                                        Rectangle()
                                                            .fill(Color(red: 55/255, green: 65/255, blue: 81/255))
                                                            .frame(width: 240, height: 8)
                                                            .cornerRadius(10)
                                                        
                                                        Rectangle()
                                                            .fill(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                            .frame(width: 140, height: 8)
                                                            .cornerRadius(10)
                                                    }
                                                    
                                                    Text("24%")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                }
                                                
                                                HStack(spacing: 12) {
                                                    Text("3★")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                    
                                                    Spacer()
                                                    
                                                    ZStack(alignment: .leading) {
                                                        Rectangle()
                                                            .fill(Color(red: 55/255, green: 65/255, blue: 81/255))
                                                            .frame(width: 240, height: 8)
                                                            .cornerRadius(10)
                                                        
                                                        Rectangle()
                                                            .fill(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                            .frame(width: 140, height: 8)
                                                            .cornerRadius(10)
                                                    }
                                                    
                                                    Text("5%  ")
                                                        .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                                }
                                            }
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
                                        ForEach(0..<5, id: \.self) { index in
                                            Image("mrPhts\(index + 1)")
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
                .padding(.top, 14)
            }
        }
    }
}

#Preview {
    MateDetailView()
}

