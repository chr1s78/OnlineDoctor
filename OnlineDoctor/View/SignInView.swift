//
//  SignInView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

struct SignInView: View {

    @State var email: String = "Ayahirano2014@126.com"
    @State var password: String = "aceace123"
    @State var fingerShow: Bool = false
    @State var navigateToHome: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            GeometryReader { geometry in
                ZStack {
                    
                   // Color(#colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 1, alpha: 1))
                    Color("background")
                        .edgesIgnoringSafeArea(.all)
                   
                    if fingerShow {
                        Color(#colorLiteral(red: 0.2, green: 0.2274509804, blue: 0.4941176471, alpha: 0.2958522569))
                            .edgesIgnoringSafeArea(.all)
                    }
                    VStack {
                        Spacer()
                        
                        /// Hey, Let's Sign in!
                        SigninHeaderView()
                        
                        /// email and password textfield
                        UserInputSignInView(email: $email, password: $password, fingerShow: $fingerShow)
                        
                        HStack {
                            Spacer()
                            NavigationLink(
                                destination: SignUpView(),
                                isActive: $navigateToHome,
                                label: {
                                    Text("Forgot Password?")
                                        .fontWeight(.light)
                                        .customFont(.subheadline)
                                })
                        }
                        .frame(width: 305)
                        .padding(.top, 10)
                        
                        ComponentLoginButtonView(type: 0)
                        
                        /// Register tip info
                        HStack {
                            Text("Don't have an account?")
                                .customFont(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.2039215686, green: 0.2235294118, blue: 0.3960784314, alpha: 1)))
                            
                            NavigationLink(
                                destination: SignUpView(),
                                isActive: $navigateToHome,
                                label: {
                                    Text("Register in here")
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.6901960784, blue: 0.5843137255, alpha: 1)))
                                        .customFont(.subheadline)
                                    
                                })
                            
                        }
                        .padding(.top, 13)
                    }
                  //  .background(Color.orange)
                    .blur(radius: fingerShow ? 8.0 : 0.0)
                    
                    FingerPrintSheetView(
                        fingerShow: self.$fingerShow,
                        navigateToHome: self.$navigateToHome,
                        maxHeight: geometry.size.height * 0.52
                    ) {
                        Color.blue
                    }
                 //   .edgesIgnoringSafeArea(.all)
                }   
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .CustomNavigationButtonStyle()
        }
       
    }
}



struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.dark)
    }
}


struct SigninHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hey,\nLet's Sign in!")
                    .fontWeight(.bold)
                    .customFont(.title1)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Text("Welcome back You've been missed")
                    .fontWeight(.light)
                    .customFont(.subheadline)
            }
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .frame(idealWidth: UIScreen.main.bounds.width * 2 / 3 )
            .padding(30)
            
            Spacer()
        }
        .padding()
    }
}


