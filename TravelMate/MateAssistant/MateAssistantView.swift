import SwiftUI

struct MateAssistantView: View {
    @StateObject var mateAssistantModel =  MateAssistantViewModel()
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
                        Image("robot")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 20, height: 20)
                    }
                    
                    Text("AI Assistant")
                        .FontBold(size: 20)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        ZStack {
                            Circle()
                                .fill(Color(red: 59/255, green: 130/255, blue: 246/255).opacity(0.2))
                                .frame(width: 64, height: 64)
                            
                            Image(.robot)
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        
                        VStack(spacing: 8) {
                            Text("Hi! I'm your travel assistant")
                                .FontBold(size: 18)
                            
                            Text("I'll be working soon!")
                                .FontRegular(size: 14, color: Color(red: 156/255, green: 163/255, blue: 175/255))
                        }
                    }
                }
                .padding(.top, 70)
            }
        }
    }
}

#Preview {
    MateAssistantView()
}

