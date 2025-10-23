import SwiftUI

struct Filter: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var isSelected = false
}

struct MateDiscoverView: View {
    @StateObject var mateDiscoverModel =  MateDiscoverViewModel()
    @State var firstFilter = [Filter(image: "fil1", name: "Pool"),Filter(image: "fil2", name: "Spa"),Filter(image: "fil3", name: "Restaurant")]
    @State var secondFilter = [Filter(image: "fil4", name: "Casino"),Filter(image: "fil5", name: "Parking"),Filter(image: "fil6", name: "Gym")]
    
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
                            ForEach(0..<3, id: \.self) { index in
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 38/255, green: 46/255, blue: 65/255), lineWidth: 3)
                                                .overlay {
                                                    VStack(alignment: .leading) {
                                                        Spacer()
                                                        
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            HStack {
                                                                Text("Golden Palace Resort")
                                                                    .FontSemiBold(size: 18)
                                                                
                                                                Spacer ()
                                                                
                                                                HStack {
                                                                    HStack(spacing: 2) {
                                                                        ForEach(0..<5, id: \.self) { index in
                                                                            Image(systemName: "star.fill")
                                                                                .resizable()
                                                                                .frame(width: 15, height: 15)
                                                                                .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                                        }
                                                                    }
                                                                    
                                                                    Text("4.9")
                                                                        .FontRegular(size: 14)
                                                                }
                                                                
                                                                Spacer()
                                                            }
                                                            
                                                            Text("Luxury casino resort with world-class gaming, premium spa services, and fine dining restaurants.")
                                                                .FontRegular(size: 14)
                                                        }
                                                        
                                                        VStack(alignment: .leading, spacing: 12) {
                                                            HStack(spacing: 12) {
                                                                ForEach(0..<4, id: \.self) { index in
                                                                    HStack {
                                                                        HStack(spacing: 4) {
                                                                            Image("fil4")
                                                                                .resizable()
                                                                                .frame(width: 15, height: 16)
                                                                            
                                                                            Text("Casino")
                                                                                .FontRegular(size: 12)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                            
                                                            HStack {
                                                                Text("$289")
                                                                    .FontBold(size: 20)
                                                                
                                                                HStack(spacing: 2) {
                                                                    Text("$385")
                                                                        .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                        .strikethrough()
                                                                    
                                                                    Text("/night")
                                                                        .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                }
                                                                
                                                                Spacer()
                                                                
                                                                Button(action: {
                                                                    
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
                                                    }
                                                    .padding(.horizontal)
                                                    .padding(.bottom, 16)
                                                }
                                        }
                                        .frame(height: 364)
                                        .cornerRadius(12)
                                    
                                    Image(.item1)
                                        .resizable()
                                        .overlay {
                                            VStack {
                                                HStack {
                                                    HStack {
                                                        Image("fil4")
                                                            .resizable()
                                                            .frame(width: 15, height: 16)
                                                        
                                                        Text("Casino Inside")
                                                            .FontMedium(size: 12)
                                                    }
                                                    .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                    .background {
                                                        LinearGradient(colors: [Color(red: 234/255, green: 180/255, blue: 5/255),
                                                                                Color(red: 249/255, green: 115/255, blue: 23/255)], startPoint: .leading, endPoint: .trailing)
                                                    }
                                                    .cornerRadius(8)
                                                    
                                                    Spacer()
                                                    
                                                    Button(action: {
                                                        
                                                    }) {
                                                        ZStack {
                                                            Circle()
                                                                .fill(.black.opacity(0.5))
                                                                .frame(width: 32, height: 32)
                                                            
                                                            Image(systemName: 1 == 1 ? "heart.fill" : "heart")
                                                                .foregroundStyle(1 == 1 ? Color(red: 248/255, green: 113/255, blue: 113/255) : .white)
                                                        }
                                                    }
                                                }
                                                
                                                Spacer()
                                                
                                                HStack {
                                                    Text("25% OFF")
                                                        .FontMedium(size: 12)
                                                        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                        .background {
                                                            Color(red: 239/255, green: 68/255, blue: 68/255)
                                                        }
                                                        .cornerRadius(8)
                                                    
                                                    Spacer()
                                                }
                                            }
                                            .padding(10)
                                        }
                                        .frame(height: 160)
                                        .clipShape(RoundedCornerShape(radius: 12, corners: [.topLeft, .topRight]))
                                }
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 35)
                    }
                }
            }
        }
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
