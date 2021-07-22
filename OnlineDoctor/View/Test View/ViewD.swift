//
//  ViewD.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import SwiftUI

struct ViewD: View {
    var body: some View {
        NavigationLink(
            destination: HomeView().navigationBarHidden(true),//VerficationView(),
            label: {
                Text("to home view")
            })
            .CustomNavigationButtonStyle()
    }
}

//struct Line1: Shape {
//    let coordinate: CGFloat
//
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//            path.move(to: .zero)
//            path.addLine(to: CGPoint(x: coordinate, y: coordinate))
//        }
//    }
//}

struct Line1: Shape {
    var coordinate: CGFloat

    var animatableData: CGFloat {
        get { coordinate }
        set { coordinate = newValue }
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: coordinate, y: coordinate))
        }
    }
}

struct RootView: View {
    @State private var coordinate: CGFloat = 0

    var body: some View {
        Line1(coordinate: coordinate)
            .stroke(Color.red)
            .animation(Animation.linear(duration: 1).repeatForever())
            .onAppear { self.coordinate = 100 }
    }
}
struct ViewD_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
