//
//  FingerPrintView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI
import Combine

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let indicatorHeight: CGFloat = 6
    static let indicatorWidth: CGFloat = 60
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.1
}

struct FingerPrintSheetView<Content: View>: View {
    
    @Binding var fingerShow: Bool
    @Binding var navigateToHome: Bool
    
    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content
    
    init(fingerShow: Binding<Bool>, navigateToHome: Binding<Bool>,maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._fingerShow = fingerShow
        self._navigateToHome = navigateToHome
    }
    
    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        fingerShow ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .fill(Color.white)
            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
        ).onTapGesture {
            self.fingerShow.toggle()
        }
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                self.indicator.padding(.bottom, 5)
                FingerBodyView(fingerShow: $fingerShow, navigateToHome: $navigateToHome)
                    .frame(height: self.maxHeight-20)
                    .clipShape(RoundedRectangle(cornerRadius: 38))
                    
                
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
               .background(Color.clear)
            .cornerRadius(Constants.radius)
            .frame(height: geometry.size.height , alignment: .bottom)
            .offset(y: fingerShow ? 0 : self.offset + self.translation + 100)
            
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.fingerShow = value.translation.height < 0
                }
            )
            
        }
    }
}

struct FingerPrintView_Previews: PreviewProvider {
    static var previews: some View {
        FingerPrintSheetView(fingerShow: .constant(true), navigateToHome: .constant(false), maxHeight: 600) {
            Rectangle().fill(Color.red)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct FingerBodyView: View {
    
    @Binding var fingerShow: Bool
    @Binding var navigateToHome: Bool
    
    @State var progress: Double = 0.0
    @State var cancllable: Cancellable? = nil
    
    
    var timer = Timer.publish(every: 0.01, on: .main, in: .common)
    
    var body: some View {
        ZStack {
            VStack(spacing: 20.0) {
                Image(systemName: "touchid")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 54, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.6901960784, blue: 0.5843137255, alpha: 1)))
                    .background(
                        Circle()
                            .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color("touchid"))
                            .background(
                                Circle()
                                    .frame(width: 124, height: 124, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color(#colorLiteral(red: 0.8039215686, green: 0.9254901961, blue: 0.9176470588, alpha: 0.3982752112)))
                            )
                    )
                    .padding(.top, 97)
                
                Text("Confirm fingerprint to Sign in")
                    .fontWeight(.light)
                    .customFont(.subheadline)
                    .padding(.top, 40)
                
                HStack {
                    Button(action: { self.fingerShow.toggle() }, label: {
                        Text("Cancel")
                            .customFont(.subheadline)
                            .foregroundColor(.black)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 1))
                                    .foregroundColor(.clear)
                            )
                    })
                    .padding(.leading, 20)
                    
                    Button(action: {
                        
                        progress = 0
                        cancllable = timer.connect()
                        
                    }, label: {
                        Text("Confirm")
                            .customFont(.subheadline)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color(#colorLiteral(red: 0.3450980392, green: 0.3607843137, blue: 0.8980392157, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    })
                    .padding()
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width - 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            
            // progressing when add to 100, then stop timer,
            // dismiss sheet view and navigate to homeview
            ProgressView("Loading...", value: progress, total: 100)
                .progressViewStyle(CustomCircularProgressViewStyle())
                .offset(y: -82)
                .onReceive(timer, perform: { _ in
                    withAnimation(.spring()) {
                        progress += 1
                        print("progress: \(progress)")
                        if progress >= 100 {
                            // 停止定时器
                            cancllable?.cancel()
                            progress = 0
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                fingerShow = false
                                navigateToHome = true
                            }
                            
                        }
                    }
            })
        }

    }
}
