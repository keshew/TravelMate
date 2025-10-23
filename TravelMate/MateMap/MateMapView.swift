import SwiftUI
import MapKit

struct MateMapView: View {
    @StateObject var mateMapModel =  MateMapViewModel()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color(red: 12/255, green: 22/255, blue: 49/255).ignoresSafeArea()
                
                Color(red: 31/255, green: 58/255, blue: 138/255)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 55)
            }
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    Button(action: {
                        
                    }) {
                        Image("map")
                            .resizable()
                            .frame(width: 20, height: 22)
                    }
                    
                    Text("TravelMap")
                        .FontBold(size: 20)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                VStack(alignment: .leading) {
                    Map(coordinateRegion: $region)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    MateMapView()
}

