//
//  HomeView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedIndex = 0
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color("tabbar"))
    }
    
    var body: some View {

            VStack {
                
                Spacer()
                ZStack {
                    
                    switch selectedIndex {
                    case 0:
                        MainView()
                    case 1:
                        CartView()
                    default:
                        AppointmentView()
                    }
                }
                
                Spacer()
                CustomTabbarView(selectedIndex: $selectedIndex)
            }
        .CustomNavigationButtonStyle()
        .edgesIgnoringSafeArea(.all)
    }
}

struct backgroundView: View {
    @Binding var selectedIndex: Int
    var body: some View {
        
        switch selectedIndex {
        case 0:
            Image("Subtract")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 84)
                .background(Color("background"))
                .scaledToFill()
        case 1:
            Image("Subtract2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 84)
                .background(Color("background"))
                .scaledToFill()
        default:
            Image("Subtract3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 84)
                .background(Color("background"))
                .scaledToFill()
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
            .previewDisplayName("iPhone 11 Pro")
        
//        HomeView()
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            .previewDisplayName("iPhone 11")
    }
}

let tabIcon = ["house", "cart", "calendar.badge.clock"]
/// Custom TabbarItem
/// ```
/// when selectedIndex tabitem tapped, draw circle background
/// ```
///
///
struct TabbarItemCircleBackgroundView: View {
    
    var radius: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: radius, height: radius)
            .foregroundColor(Color("main"))
          //  .background(Color.red)
    }
}

struct TabbarItemView: View {
    
    @Binding var selectedIndex: Int
    @State var radius: CGFloat = 0.0
    
    var index: Int
    
    var body: some View {
        
        ZStack {
        
            if selectedIndex == index {
                TabbarItemCircleBackgroundView(radius: self.radius)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .onAppear {
                        self.radius = 60
                    }
                    .onDisappear {
                        self.radius = 0
                    }
            }
            Image(systemName: tabIcon[index])
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 19, height: 19)
                .font(.system(size: 24, weight: .light))
                .foregroundColor( selectedIndex == index ? .white : Color(#colorLiteral(red: 0.2039215686, green: 0.2235294118, blue: 0.3960784314, alpha: 1)))
        }
        .onAppear {
        //    withAnimation(.easeInOut(duration: 0.3)) {
                
        //    }
        }
    }
}

struct CustomTabbarView: View {
    
    @Binding var selectedIndex: Int
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 38) {
            Button(action: {
                self.selectedIndex = 0
            }) {
                TabbarItemView(selectedIndex: $selectedIndex, index: 0)
            }
            .frame(idealWidth: 60, idealHeight: 60)
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .offset(y: -14)
  
            Button(action: {
                self.selectedIndex = 1
            }) {
                TabbarItemView(selectedIndex: $selectedIndex, index: 1)
            }
            .frame(idealWidth: 60, idealHeight: 60)
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .offset(y: -14)
            
            Button(action: {
                self.selectedIndex = 2
            }) {
                TabbarItemView(selectedIndex: $selectedIndex, index: 2)
            }
            .frame(idealWidth: 60, idealHeight: 60)
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .offset(y: -14)

        }
        .background(
            backgroundView(selectedIndex: $selectedIndex)
                .animation(.spring())
        )
        //.frame(height: 85)
        
    }
}
