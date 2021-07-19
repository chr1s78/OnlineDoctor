//
//  LoginComponent.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/19.
//

import SwiftUI

// Password SecureField View
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
                    .frame(width: 265, height: 50, alignment: .leading)
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
                    .frame(width: 265, height: 50, alignment: .leading)
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

// Email TextField View
struct EmailFieldView: View {
    
    @Binding var email: String
    
    var body: some View {
        TextField("Email", text: $email)
            .textFieldStyle(PlainTextFieldStyle())
            .frame(width: 325, height: 50, alignment: .leading)
            .offset(x: 30)
            .foregroundColor(.black)
            .background(
                Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1))
                    .clipShape(RoundedRectangle(cornerRadius: 100))
            )
            .padding(.bottom, 15)
    }
}

// Combine Email & Password Field
struct UserInputSignInView: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var fingerShow: Bool
    
    var body: some View {
        VStack {
           EmailFieldView(email: $email)
            
            HStack {
                PasswordFieldView(password: $password)
                
                FingerPrintView(fingerShow: $fingerShow)
            }
        }
    }
}

// Finger Print View
struct FingerPrintView: View {
    
    @Binding var fingerShow: Bool
    
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
                .onTapGesture {
                    fingerShow.toggle()
                }
//                .sheet(isPresented: $fingerShow, content: {
//               //     SheetFingerPrintView()
//               //         .frame(maxHeight: 400)
//                })
        }
    }
}

// Log in Button View
struct LoginButton: View {
    var body: some View {
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
    }
}

// Log in with Google Button View
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
