import SwiftUI

struct MateFavouriteView: View {
    @StateObject var mateFavouriteModel =  MateFavouriteViewModel()
    
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
                                                                    .FontSemiBold(size: 16)
                                                                
                                                                Spacer ()
                                                                
                                                                HStack {
                                                                    Image(systemName: "star.fill")
                                                                        .resizable()
                                                                        .frame(width: 15, height: 15)
                                                                        .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                                    
                                                                    Text("4.9")
                                                                        .FontRegular(size: 14)
                                                                }
                                                            }
                                                            
                                                            Text("Luxury hotel in downtown")
                                                                .FontRegular(size: 14)
                                                        }
                                                        
                                                        VStack(alignment: .leading, spacing: 12) {
                                                            HStack {
                                                                Text("$189/night")
                                                                    .FontSemiBold(size: 16, color: .blue)
                                                                
                                                                Spacer()
                                                                
                                                                Button(action: {
                                                                    
                                                                }) {
                                                                    Rectangle()
                                                                        .fill(Color(red: 239/255, green: 68/255, blue: 68/255).opacity(0.3))
                                                                        .overlay {
                                                                            RoundedRectangle(cornerRadius: 8)
                                                                                .stroke(Color(red: 113/255, green: 42/255, blue: 56/255), lineWidth: 3)
                                                                                .overlay {
                                                                                    HStack {
                                                                                        Image("remove")
                                                                                            .resizable()
                                                                                            .frame(width: 10, height: 12)
                                                                                        
                                                                                        Text("Remove")
                                                                                            .FontMedium(size: 14, color: Color(red: 248/255, green: 113/255, blue: 113/255))
                                                                                    }
                                                                                }
                                                                        }
                                                                        .frame(width: 98, height: 30)
                                                                        .cornerRadius(8)
                                                                }
                                                                
                                                                Button(action: {
                                                                    
                                                                }) {
                                                                    Rectangle()
                                                                        .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                                                                        .overlay {
                                                                            Text("View")
                                                                                .FontMedium(size: 14)
                                                                        }
                                                                        .frame(width: 57, height: 30)
                                                                        .cornerRadius(8)
                                                                }
                                                            }
                                                        }
                                                    }
                                                    .padding(.horizontal)
                                                    .padding(.bottom, 16)
                                                }
                                        }
                                        .frame(height: 248)
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
                                                    Spacer()
                                                    
                                                    Text("2 days ago")
                                                        .FontMedium(size: 12)
                                                        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                        .background {
                                                            Color.black.opacity(0.7)
                                                        }
                                                        .cornerRadius(8)
                                                }
                                            }
                                            .padding(10)
                                        }
                                        .frame(height: 128)
                                        .clipShape(RoundedCornerShape(radius: 12, corners: [.topLeft, .topRight]))
                                }
                                .padding(.horizontal)
                            }
                            
                            Color.clear.frame(height: 60)
                        }
                        .padding(.top, 25)
                    }
                    .offset(y: -6)
                }
            }
        }
    }
}

#Preview {
    MateFavouriteView()
}

