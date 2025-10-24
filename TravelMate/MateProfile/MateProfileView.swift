import SwiftUI

struct MateProfileView: View {
    @StateObject var mateProfileModel =  MateProfileViewModel()
    @StateObject var bookingStore = BookingStore()
    @State private var showClearDataAlert = false

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
                    Image(.person)
                        .resizable()
                        .frame(width: 18, height: 20)
                    
                    Text("Profile")
                        .FontBold(size: 20)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 24) {
                            VStack(alignment: .leading, spacing: 24) {
                                Text("Notifications")
                                    .FontSemiBold(size: 18)
                                
                                Rectangle()
                                    .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                            .overlay {
                                                VStack(spacing: 24) {
                                                    HStack {
                                                        Image(.prof1)
                                                            .resizable()
                                                            .frame(width: 40, height: 40)
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("Deals & Offers")
                                                                .FontMedium(size: 16)
                                                            
                                                            Text("Get notified about special deals")
                                                                .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                        }
                                                        .padding(.leading, 5)
                                                        
                                                        Spacer()
                                                        
                                                        Toggle("", isOn: $mateProfileModel.isNotifOn)
                                                            .toggleStyle(CustomToggleStyle())
                                                            .frame(width: 48)
                                                    }
                                                    
                                                    HStack {
                                                        ZStack {
                                                            Circle()
                                                                .fill(Color(red: 59/255, green: 130/255, blue: 246/255).opacity(0.2))
                                                                .frame(width: 40, height: 40)
                                                            
                                                            Image(.prof2)
                                                                .resizable()
                                                                .frame(width: 16, height: 16)
                                                        }
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("Deals & Offers")
                                                                .FontMedium(size: 16)
                                                            
                                                            Text("Booking updates and confirmations")
                                                                .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                        }
                                                        .padding(.leading, 5)
                                                        
                                                        Spacer()
                                                        
                                                        Toggle("", isOn: $mateProfileModel.isVib)
                                                            .toggleStyle(CustomToggleStyle())
                                                            .frame(width: 48)
                                                    }
                                                    
                                                    HStack {
                                                        Image(.prof3)
                                                            .resizable()
                                                            .frame(width: 40, height: 40)
                                                        
                                                        VStack(alignment: .leading) {
                                                            Text("Deals & Offers")
                                                                .FontMedium(size: 16)
                                                            
                                                            Text("New venues in your area")
                                                                .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                        }
                                                        .padding(.leading, 5)
                                                        
                                                        Spacer()
                                                        
                                                        Toggle("", isOn: $mateProfileModel.isOn)
                                                            .toggleStyle(CustomToggleStyle())
                                                            .frame(width: 48)
                                                    }
                                                }
                                                .padding(.horizontal)
                                            }
                                    }
                                    .frame(height: 238)
                                    .cornerRadius(12)
                            }
                         
                            VStack(alignment: .leading, spacing: 17) {
                                Text("Privacy & Data")
                                    .FontSemiBold(size: 18)
                                
                                Button(action: {
                                    
                                }) {
                                    Rectangle()
                                        .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                                .overlay {
                                                    VStack(spacing: 24) {
                                                        HStack {
                                                            Image(.prof4)
                                                                .resizable()
                                                                .frame(width: 40, height: 40)
                                                            
                                                            VStack(alignment: .leading) {
                                                                Text("Privacy Settings")
                                                                    .FontMedium(size: 16)
                                                                
                                                                Text("Manage your data and privacy")
                                                                    .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                            }
                                                            .padding(.leading, 5)
                                                            
                                                            Spacer()
                                                            
                                                            Image(systemName: "chevron.right")
                                                                .resizable()
                                                                .foregroundStyle(Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                .frame(width: 10, height: 16)
                                                        }
                                                    }
                                                    .padding(.horizontal)
                                                }
                                        }
                                        .frame(height: 78)
                                        .cornerRadius(12)
                                }
                                
                                Button(action: {
                                    showClearDataAlert = true
                                }) {
                                    Rectangle()
                                        .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                                .overlay {
                                                    VStack(spacing: 24) {
                                                        HStack {
                                                            Image(.prof5)
                                                                .resizable()
                                                                .frame(width: 40, height: 40)
                                                            
                                                            VStack(alignment: .leading) {
                                                                Text("Data Management")
                                                                    .FontMedium(size: 16)
                                                                
                                                                Text("Download or delete your data")
                                                                    .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                            }
                                                            .padding(.leading, 5)
                                                            
                                                            Spacer()
                                                            
                                                            Image(systemName: "chevron.right")
                                                                .resizable()
                                                                .foregroundStyle(Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                .frame(width: 10, height: 16)
                                                        }
                                                    }
                                                    .padding(.horizontal)
                                                }
                                        }
                                        .frame(height: 78)
                                        .cornerRadius(12)
                                }
                                .alert("Are you sure you want to delete all data?", isPresented: $showClearDataAlert) {
                                    Button("Delete", role: .destructive) {
                                        bookingStore.clearAllBookings()
                                    }
                                    Button("Cancel", role: .cancel) {}
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 17) {
                                Text("Support")
                                    .FontSemiBold(size: 18)
                                
                                    Rectangle()
                                        .fill(Color(red: 14/255, green: 23/255, blue: 45/255))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color(red: 61/255, green: 69/255, blue: 87/255))
                                                .overlay {
                                                    VStack(spacing: 16) {
                                                        Button(action: {
                                                            
                                                        }) {
                                                            VStack(spacing: 24) {
                                                                HStack {
                                                                    Image(.prof6)
                                                                        .resizable()
                                                                        .frame(width: 40, height: 40)
                                                                    
                                                                    VStack(alignment: .leading) {
                                                                        Text("Contact Support")
                                                                            .FontMedium(size: 16)
                                                                        
                                                                        Text("Get help with your account")
                                                                            .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                    }
                                                                    .padding(.leading, 5)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Image(systemName: "chevron.right")
                                                                        .resizable()
                                                                        .foregroundStyle(Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                        .frame(width: 10, height: 16)
                                                                }
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                        
                                                        Rectangle()
                                                            .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                                                            .frame(height: 1)
                                                        
                                                        Button(action: {
                                                            
                                                        }) {
                                                            VStack(spacing: 24) {
                                                                HStack {
                                                                    Image(.prof7)
                                                                        .resizable()
                                                                        .frame(width: 40, height: 40)
                                                                    
                                                                    VStack(alignment: .leading) {
                                                                        Text("FAQ")
                                                                            .FontMedium(size: 16)
                                                                        
                                                                        Text("Frequently asked questions")
                                                                            .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                    }
                                                                    .padding(.leading, 5)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Image(systemName: "chevron.right")
                                                                        .resizable()
                                                                        .foregroundStyle(Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                        .frame(width: 10, height: 16)
                                                                }
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                        
                                                        
                                                        Rectangle()
                                                            .fill(Color(red: 38/255, green: 46/255, blue: 66/255))
                                                            .frame(height: 1)
                                                        
                                                        Button(action: {
                                                            
                                                        }) {
                                                            VStack(spacing: 24) {
                                                                HStack {
                                                                    Image(.prof8)
                                                                        .resizable()
                                                                        .frame(width: 40, height: 40)
                                                                    
                                                                    VStack(alignment: .leading) {
                                                                        Text("Send Feedback")
                                                                            .FontMedium(size: 16)
                                                                        
                                                                        Text("Help us improve the app")
                                                                            .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                    }
                                                                    .padding(.leading, 5)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Image(systemName: "chevron.right")
                                                                        .resizable()
                                                                        .foregroundStyle(Color(red: 156/255, green: 163/255, blue: 175/255))
                                                                        .frame(width: 10, height: 16)
                                                                }
                                                            }
                                                        }
                                                        .padding(.horizontal)
                                                    }
                                                }
                                        }
                                        .frame(height: 232)
                                        .cornerRadius(12)
                               
                            }
                            
                            Color.clear.frame(height: 60)
                        }
                        .padding(.top, 25)
                        .padding(.horizontal)
                    }
                    .offset(y: -6)
                }
            }
        }
    }
}

#Preview {
    MateProfileView()
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color(red: 59/255, green: 130/255, blue: 246/255) : Color(red: 75/255, green: 85/255, blue: 99/255))
                .frame(width: 44, height: 24)
                .overlay(
                    Circle()
                        .fill(.white)
                        .frame(width: 20, height: 20)
                        .offset(x: configuration.isOn ? 10 : -10)
                        .animation(.easeInOut, value: configuration.isOn)
                )
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}
