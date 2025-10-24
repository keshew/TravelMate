import SwiftUI

struct MateFavouriteView: View {
    @StateObject var bookingStore = BookingStore()
    
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
                            if bookingStore.bookings.isEmpty {
                                Text("There are no favourite place yet")
                                    .FontMedium(size: 14, color: .gray)
                                    .padding(.top)
                            } else {
                                ForEach(bookingStore.bookings) { booking in
                                    ZStack(alignment: .top) {
                                        Rectangle()
                                            .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color(red: 38/255, green: 46/255, blue: 65/255), lineWidth: 3)
                                                    .overlay {
                                                        VStack(alignment: .leading, spacing: 10) {
                                                            Spacer()
                                                            VStack(alignment: .leading, spacing: 14) {
                                                                HStack {
                                                                    Text(booking.place.name)
                                                                        .FontSemiBold(size: 16)
                                                                    Spacer()
                                                                    HStack {
                                                                        Image(systemName: "star.fill")
                                                                            .resizable()
                                                                            .frame(width: 15, height: 15)
                                                                            .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                                        Text(String(format: "%.1f", booking.place.rating))
                                                                            .FontRegular(size: 14)
                                                                    }
                                                                }
                                                                Text(booking.place.descriptionShort)
                                                                    .FontRegular(size: 14)
                                                                VStack(alignment: .leading, spacing: 12) {
                                                                    HStack {
                                                                        Text(String(format: "$%.0f/night", booking.place.priceCurrent))
                                                                            .FontSemiBold(size: 16, color: .blue)
                                                                        Spacer()
                                                                        
                                                                        Button(action: {
                                                                            withAnimation {
                                                                                bookingStore.removeBooking(booking)
                                                                            }
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
                                                                        //                                                                    Button(action: {
                                                                        //                                                                        // Перейти в детали
                                                                        //                                                                    }) {
                                                                        //                                                                        Rectangle()
                                                                        //                                                                            .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                                                                        //                                                                            .overlay {
                                                                        //                                                                                Text("View")
                                                                        //                                                                                    .FontMedium(size: 14)
                                                                        //                                                                            }
                                                                        //                                                                            .frame(width: 57, height: 30)
                                                                        //                                                                            .cornerRadius(8)
                                                                        //                                                                    }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                        .padding(.bottom)
                                                    }
                                            }
                                            .frame(height: 258)
                                            .cornerRadius(12)
                                        
                                        Image(booking.place.imageName)
                                            .resizable()
                                            .overlay {
                                                VStack {
                                                    HStack {
                                                        HStack {
                                                            Image("fil4")
                                                                .resizable()
                                                                .frame(width: 15, height: 16)
                                                            Text(booking.place.type)
                                                                .FontMedium(size: 12)
                                                        }
                                                        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                        .background {
                                                            LinearGradient(colors: [Color(red: 234/255, green: 180/255, blue: 5/255),
                                                                                    Color(red: 249/255, green: 115/255, blue: 23/255)],
                                                                           startPoint: .leading, endPoint: .trailing)
                                                        }
                                                        .cornerRadius(8)
                                                        
                                                        Spacer()
                                                        
                                                        Button(action: {
                                                            // Добавить логику переключения фаворита
                                                        }) {
                                                            ZStack {
                                                                Circle()
                                                                    .fill(.black.opacity(0.5))
                                                                    .frame(width: 32, height: 32)
                                                                
                                                                Image(systemName: "heart.fill")
                                                                    .foregroundStyle(Color(red: 248/255, green: 113/255, blue: 113/255))
                                                            }
                                                        }
                                                    }
                                                    Spacer()
                                                    HStack {
                                                        Spacer()
                                                        
                                                        Text(timeAgoString(from: booking.date))
                                                            .FontMedium(size: 12)
                                                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                                                            .background(Color.black.opacity(0.7))
                                                            .cornerRadius(8)
                                                    }
                                                }
                                                .padding(10)
                                            }
                                            .frame(height: 128)
                                            .clipShape(RoundedCornerShape(radius: 12, corners: [.topLeft, .topRight]))
                                    }
                                    
                                }
                            }
                        }
                        .padding(.top)
                    }
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 16)
                }
                .offset(y: -6)
            }
        }
    }
    
    func timeAgoString(from date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

#Preview {
    MateFavouriteView()
}
