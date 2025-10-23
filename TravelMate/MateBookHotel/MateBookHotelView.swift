import SwiftUI

struct MateBookHotelView: View {
    @StateObject var mateBookHotelModel =  MateBookHotelViewModel()
    @State var name = ""
    @State var email = ""
    @State var phone = ""
    @State var date = Date()
    @State var secondDate = Date()
    
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
                                    Image(.item1)
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .cornerRadius(12)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Grand Plaza Hotel")
                                            .FontSemiBold(size: 18)
                                        
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .foregroundStyle(Color(red: 250/255, green: 204/255, blue: 23/255))
                                                .frame(width: 14, height: 14)
                                            
                                            Text("4.8 (2,847 reviews)")
                                                .FontRegular(size: 14, color: Color(red: 209/255, green: 213/255, blue: 219/255))
                                        }
                                        
                                        Text("$189/night")
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
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            Text("Guests")
                                                                .FontMedium(size: 14)
                                                            
                                                            ZStack {
                                                                HStack {
                                                                    Text("1 Guest")
                                                                        .FontRegular(size: 16)
                                                                        .foregroundColor(.white)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Image(systemName: "chevron.down")
                                                                        .resizable()
                                                                        .frame(width: 17, height: 10)
                                                                        .foregroundStyle(.white)
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
                                                            }
                                                            .labelsHidden()
                                                        }
                                                        
                                                        VStack(alignment: .leading, spacing: 8) {
                                                            Text("Rooms")
                                                                .FontMedium(size: 14)
                                                            
                                                            ZStack {
                                                                HStack {
                                                                    Text("1 Room")
                                                                        .FontRegular(size: 16)
                                                                        .foregroundColor(.white)
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Image(systemName: "chevron.down")
                                                                        .resizable()
                                                                        .frame(width: 17, height: 10)
                                                                        .foregroundStyle(.white)
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
                                                                
                                                            }
                                                            .labelsHidden()
                                                        }
                                                    }
                                                    
                                                    VStack(alignment: .leading, spacing: 8) {
                                                        Text("Rooms")
                                                            .FontMedium(size: 14)
                                                        
                                                        ZStack {
                                                            HStack {
                                                                Text("Deluxe Room - $189/night")
                                                                    .FontRegular(size: 16)
                                                                
                                                                Spacer()
                                                                
                                                                Image(systemName: "chevron.down")
                                                                    .resizable()
                                                                    .frame(width: 17, height: 10)
                                                                    .foregroundStyle(.white)
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
                                                            
                                                        }
                                                        .labelsHidden()
                                                    }
                                                }
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 344)
                                .cornerRadius(12)
                                .padding(.horizontal)
                            
                            Button(action: {
                                
                            }) {
                                Rectangle()
                                    .fill(1 != 1 ? Color(red: 59/255, green: 130/255, blue: 246/255) : Color(red: 75/255, green: 85/255, blue: 99/255))
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

#Preview {
    MateBookHotelView()
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
