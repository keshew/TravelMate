import SwiftUI

struct Onb {
    var img: String
    var title: String
    var desc: String
}

struct MateOnboardingView: View {
    @StateObject var mateOnboardingModel =  MateOnboardingViewModel()
    @State var currentIndex = 0
    var onb = [Onb(img: "onb2", title: "AI-Powered Search", desc: "Find perfect venues with smart recommendations"),
               Onb(img: "onb2", title: "AI-Powered Search", desc: "Find perfect venues with smart recommendations"),
               Onb(img: "onb3", title: "Interactive Maps", desc: "Explore locations with detailed venue information"),
               Onb(img: "onb4", title: "Premium Experiences", desc: "Access exclusive casino hotels and entertainment")]
    @State var isTab = false
    var body: some View {
        ZStack {
            Color(red: 12/255, green: 22/255, blue: 49/255).ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(.onb)
                    .resizable()
                    .frame(width: 79, height: 74)
                    .opacity(currentIndex == 0 ? 1 : 0)
                
                VStack(spacing: currentIndex == 0 ? 70 : 167) {
                    VStack(spacing: 10) {
                        if currentIndex == 0 {
                            VStack(spacing: -10) {
                                Text("Welcome to")
                                    .FontBold(size: 36)
                                
                                Text("TravelMate")
                                    .FontBold(size: 36, color: Color(red: 59/255, green: 130/255, blue: 246/255))
                            }
                            
                            Text("Discover luxury hotels with world-\nclass casinos, entertainment, and unforgettable experiences")
                                .FontRegular(size: 18)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                        } else {
                            Rectangle()
                                .fill(Color(red: 35/255, green: 45/255, blue: 70/255))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(red: 85/255, green: 92/255, blue: 111/255))
                                        .overlay {
                                            HStack(spacing: 15) {
                                                Image(onb[currentIndex].img)
                                                    .resizable()
                                                    .frame(width: 44, height: 52)
                                                
                                                VStack(alignment: .leading) {
                                                    Text(onb[currentIndex].title)
                                                        .FontSemiBold(size: 16)
                                                    
                                                    Text(onb[currentIndex].desc)
                                                        .FontRegular(size: 14)
                                                }
                                                
                                                Spacer()
                                            }
                                            .padding(.horizontal)
                                        }
                                }
                                .frame(height: 98)
                                .cornerRadius(12)
                                .padding(.horizontal)
                        }
                    }
                    
                    VStack(spacing: 24) {
                        HStack {
                            ForEach(0..<4) { index in
                                if currentIndex == index {
                                    Rectangle()
                                        .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                                        .frame(width: 32, height: 8)
                                        .cornerRadius(10)
                                } else {
                                    Circle()
                                        .fill(Color(red: 85/255, green: 92/255, blue: 111/255))
                                        .frame(width: 8, height: 8)
                                }
                            }
                        }
                        
                        VStack(spacing: 16) {
                            Button(action: {
                                if currentIndex <= 2 {
                                    withAnimation {
                                        currentIndex += 1
                                    }
                                } else {
                                    isTab = true
                                }
                            }) {
                                Rectangle()
                                    .fill(Color(red: 59/255, green: 130/255, blue: 246/255))
                                    .overlay {
                                        Text(currentIndex == 0 ? "Get Started" : "Next")
                                            .FontSemiBold(size: 18)
                                    }
                                    .frame(height: 60)
                                    .cornerRadius(12)
                            }
                            
                            Button(action: {
                                
                            }) {
                                Rectangle()
                                    .fill(.clear)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(Color(red: 85/255, green: 92/255, blue: 111/255))
                                            .overlay {
                                                Text("Continue as Guest")
                                                    .FontSemiBold(size: 18)
                                            }
                                    }
                                    .frame(height: 60)
                                    .cornerRadius(12)
                            }
                            .opacity(0)
                            .disabled(true)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 24)
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isTab) {
            MateTabBarView()
        }
    }
}

#Preview {
    MateOnboardingView()
}

