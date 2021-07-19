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
                    
                    Color(#colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 1, alpha: 1))
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
                            Text("Forgot Password?")
                                .fontWeight(.light)
                                .customFont(.subheadline)
                        }
                        .frame(width: 305)
                        .padding(.top, 10)
                        
                        /// Log in Button with arrwo
                        LoginButtonView()
                            .padding(.top, 100)
                        
                        /// divider with text
                        DividerWithTextView(text: " Or Login With ")
                            .padding(.top, 25)
                        
                        /// log in with google
                        LoginWithGoogleButton()
                            .padding(.top, 25)
                        
                        /// Register tip info
                        HStack {
                            Text("Don't have an account?")
                                .customFont(.subheadline)
                                .foregroundColor(Color(#colorLiteral(red: 0.2039215686, green: 0.2235294118, blue: 0.3960784314, alpha: 1)))
                            
                            NavigationLink(
                                destination: /*@START_MENU_TOKEN@*/Text("Destination")/*@END_MENU_TOKEN@*/,
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
                .navigationBarHidden(true)
                
            }
        }
       
    }
}

struct DividerWithTextView: View {
    var text: String = ""
    
    var body: some View {
        ZStack {
            Divider()
            
            Text(text)
                .fontWeight(.light)
                .customFont(.subheadline)
                .background(Color(#colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 1, alpha: 1)))
        }
        .frame(width: 305)
    }
}

struct LoginButtonView: View {
    var body: some View {
        
        NavigationLink(
            destination: HomeView(),
            label: {
                LoginButton()
            })
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
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
            .padding(30)
            
            Spacer()
        }
        .padding()
    }
}


