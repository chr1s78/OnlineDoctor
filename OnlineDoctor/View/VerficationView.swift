//
//  VerficationView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/20.
//

import SwiftUI

struct VerficationView: View {
    
    @StateObject var vm = FieldViewModel()
    @State var email: String = ""
    
    var body: some View {
        ZStack {
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                HeaderTextView(title: "Enter your\nverification code", subtitle: "We have sent the code verification to Your email")
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        TextField("Email", text: $email)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(width: 245, height: 50, alignment: .leading)
                            .offset(x: 30)
                            .foregroundColor(.black)
                            .background(
                                Color(#colorLiteral(red: 0.9254901961, green: 0.9490196078, blue: 1, alpha: 1))
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                            )
                        
                        Image(systemName: "paperplane.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 42, height: 42)
                            .foregroundColor(Color("main"))
                    }
                    
                    Text("Change email form fill above to change your email account.")
                        .multilineTextAlignment(.leading)
                        .customFont(.subheadline)
                        .frame(idealWidth: 286)
                        .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                }
                .padding(.bottom, 20)
                
                
                VStack(alignment: .center, spacing: 15) {
                    Text("Verification code")
                        .customFont(.title2)
                        .alignmentGuide(.center, computeValue: { dimension in
                            142
                        })
                    
                    HStack {
                        VerifyCodeField(index: 0, fIndex: $vm.f1)
                        VerifyCodeField(index: 1, fIndex: $vm.f2)
                        VerifyCodeField(index: 2, fIndex: $vm.f3)
                        VerifyCodeField(index: 3, fIndex: $vm.f4)
                        
                    }
                    .font(.largeTitle, weight: .heavy)
                    .keyboardType(.numberPad)
                    
                    Text("You can request the next code in 49 seconds")
                        .customFont(.subheadline)
                }
                .padding(.bottom, 152)
                
                if vm.code != "" && vm.code.count == 4 {
                    
                    NavigationLink(destination: HomeView()) {
                        HStack {
                            Text("Verify and Create Account")
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
                } else {
                    HStack {
                        Text("Verify and Create Account")
                            .customFont(.subheadline)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                            .customFont(.subheadline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 305, height: 50)
                    .background(Color.gray)
                    .cornerRadius(25)
                    .shadow(radius: 25)
                }
                
                Spacer().frame(width: 1, height: 140)
                //  .background(Color.red)
            }
            .frame(idealWidth: UIScreen.main.bounds.width, idealHeight: UIScreen.main.bounds.height)
            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
        .CustomNavigationButtonStyle()
    }
}

struct VerficationView_Previews: PreviewProvider {
    static var previews: some View {
        VerficationView()
    }
}
