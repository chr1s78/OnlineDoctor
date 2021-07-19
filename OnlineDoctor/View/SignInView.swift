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
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color(#colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 1, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    /// Hey, Let's Sign in!
                    SigninHeaderView()
                    
                    /// email and password textfield
                    UserInputSignInView(email: $email, password: $password)
                    
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
                            label: {
                                Text("Register in here")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.6901960784, blue: 0.5843137255, alpha: 1)))
                                    .customFont(.subheadline)
                                
                            })
                    }
                    .padding(.top, 13)
                }
            }
            .navigationBarHidden(true)
         //   .edgesIgnoringSafeArea(.all)
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

struct LoginWithGoogleButton: View {
    var body: some View {
        
        Button(action: {
            
        }, label: {
            HStack(spacing: 0.0) {
               
                Image("google")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text("Login with Google")
                    .customFont(.subheadline)
                    .foregroundColor(.black)
            }
            .frame(width: 305, height: 50)
            .background(Color.white)
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 0.8))
                    .foregroundColor(.clear)
                    
            )
        })
    }
}

struct LoginButtonView: View {
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack(spacing: 0.0) {
                Text("Login")
                    .customFont(.subheadline)
                    .foregroundColor(.white)
                Image(systemName: "arrow.right")
                    .customFont(.subheadline)
                    .foregroundColor(.white)
            }
            .frame(width: 305, height: 50)
            .background(Color("main"))
            .cornerRadius(25)
            .shadow(radius: 25)
        })
       
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct FingerPrintView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1019607843, green: 0.6901960784, blue: 0.5843137255, alpha: 0.2015190882))
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .clipShape(Circle())
            
            Image(systemName: "touchid")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 18, height: 18, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 0.1019607843, green: 0.6901960784, blue: 0.5843137255, alpha: 1)))
        }
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

struct PasswordFieldView: View {
    
    @Binding var password: String
    @State var showPassword: Bool = false
    
    var body: some View {
        ZStack {
            if !self.showPassword {
                SecureField("Password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    
                    .foregroundColor(.black)
                    .modifier(TextFieldClearButton(text: $password, showPassword: $showPassword))
                    .frame(width: 245, height: 50, alignment: .leading)
                    .offset(x: 30)
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .background(
                        Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    )
            } else {
                TextField("Password", text: $password)
                    .textFieldStyle(PlainTextFieldStyle())
                    
                    .foregroundColor(.black)
                    .modifier(TextFieldClearButton(text: $password, showPassword: $showPassword))
                    .frame(width: 245, height: 50, alignment: .leading)
                    .offset(x: 30)
                    .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    .background(
                        Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    )
            }
            
        }
    }
}

struct UserInputSignInView: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(width: 305, height: 50, alignment: .leading)
                .offset(x: 30)
                .foregroundColor(.black)
                .background(
                    Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                )
                .padding(.bottom, 15)
            
            HStack {
                PasswordFieldView(password: $password)
                
                FingerPrintView()
            }
        }
    }
}
