import SwiftUI

struct MateTabBarView: View {
    @StateObject var mateTabBarModel =  MateTabBarViewModel()
    @State private var selectedTab: CustomTabBar.TabType = .Discover
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                if selectedTab == .Discover {
                    MateDiscoverView()
                } else if selectedTab == .Map {
                    MateMapView()
                } else if selectedTab == .AIAssistant {
                    MateAssistantView()
                } else if selectedTab == .Favorites {
                    MateFavouriteView()
                } else if selectedTab == .Profile {
                    MateProfileView()
                }
            }
            .frame(maxHeight: .infinity)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 0)
            }
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MateTabBarView()
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabType
    
    enum TabType: Int {
        case Discover
        case Map
        case AIAssistant
        case Favorites
        case Profile
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                Rectangle()
                    .fill(Color(red: 31/255, green: 58/255, blue: 138/255))
                    .frame(height: 110)
                    .edgesIgnoringSafeArea(.bottom)
                    .offset(y: 35)
            }
            
            HStack(spacing: 30) {
                TabBarItem(imageName: "tab1", tab: .Discover, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab2", tab: .Map, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab3", tab: .AIAssistant, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab4", tab: .Favorites, selectedTab: $selectedTab)
                TabBarItem(imageName: "tab5", tab: .Profile, selectedTab: $selectedTab)
            }
            .padding(.top, 10)
            .frame(height: 60)
        }
    }
}

struct TabBarItem: View {
    let imageName: String
    let tab: CustomTabBar.TabType
    @Binding var selectedTab: CustomTabBar.TabType
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = tab
            }
        }) {
            VStack(spacing: 12) {
                VStack {
                    Image(selectedTab == tab ? "\(imageName)Picked" : imageName)
                        .resizable()
                        .frame(width: tab == .AIAssistant ? 20 : tab == .Profile ? 16 : tab == .Map ? 20 : 18, height: 18)
                    
                    Text("\(tab)")
                        .FontRegular(
                            size: 12,
                            color: selectedTab == tab
                            ? Color(red: 59/255, green: 130/255, blue: 246/255) : Color(red: 156/255, green: 163/255, blue: 175/255))
                }
            }
        }
    }
}
