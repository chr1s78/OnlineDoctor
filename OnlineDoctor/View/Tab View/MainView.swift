//
//  MainView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = MainViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            GeometryReader { gtr in
                
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        // Header Row view
                        MainHeaderView()
                        
                        // Search bar Row view
                        SearchBarRowView(searchText: $searchText)
                        
                        // Doctor Scroll Row View
                        DoctorScrollView()
                            .environmentObject(vm)
                        
                        // Your Appointment Row View
                        YourAppointmentRowView()
                            .environmentObject(vm)
                            .padding(.top , 30)
                        
                        Spacer()
                    }
                    .frame(width: gtr.size.width - 60)
                    Spacer()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        YourAppointmentRowView()
            .environmentObject(MainViewModel())
    }
}

struct MainHeaderView: View {
    var body: some View {
        HStack {
            Image("Account")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 60)
            
            Spacer()
            
            
            Image(systemName: "bell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color(#colorLiteral(red: 0.3450980392, green: 0.3607843137, blue: 0.8980392157, alpha: 1)))
                        .frame(width: 38, height: 38)
                    
                )
        }
        .padding(.top, 30)
    }
}

struct SearchBarRowView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Let's Find Your Doctor")
                .bold()
                .customFont(.title3)
                .padding(.leading, -90)
            
            HStack(spacing: 10) {
                SearchBarView(placeholder: "Search a doctor", search: $searchText)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("searchbtn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                })
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 35)
    }
}

struct DoctorScrollView: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(vm.data) { doc in
                    DoctorCellView(data: doc)
                }
            }
        }
     //   .padding(.leading, 35)
        .padding(.top, 15)
    }
}

struct DoctorCellView: View {
    
    var data: DoctorSimpleInfo
        
    var body: some View {
        
        ZStack {
            Color("field")
                .frame(width: 145, height: 215)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack {
                DoctorPhotoView(photo: data.photo, name: data.name, type: data.type)
                
                DoctorSimpleInfoView(rating: data.rating, experience: data.experience)
            }
            //  .padding(.bottom)
        }
    }
}

struct DoctorPhotoView: View {
    
    var photo: String
    var name: String
    var type: String
    
    var body: some View {
        ZStack {
            Image(photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 129, height: 172)
                .blendMode(.plusDarker)
            
            VStack {
                Text(name)
                    .fontWeight(.heavy)
                    .customFont(.callout)
                    .foregroundColor(.white)
                    .shadow(color: Color(#colorLiteral(red: 0.05882352941, green: 0.08235294118, blue: 0.2, alpha: 0.209454467)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
                
                Text(type)
                    .customFont(.caption2)
                    .foregroundColor(.white)
            }
            .padding(.top, 130)
          //  .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct DoctorSimpleInfoView: View {
    
    var rating: Double
    var experience: Int
    
    var body: some View {
        HStack(spacing: 15) {
            HStack(spacing: 5) {
                Image("rating")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                
                VStack(alignment: .leading) {
                    Text("rating")
                        .customFont(.caption1)
                    Text("\(rating, specifier: "%.1f")")
                        .bold()
                        .customFont(.caption2)
                }
            }
            
            HStack(spacing: 5) {
                Image("experience")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .lineLimit(1)
                    .fixedSize(horizontal: true, vertical: true)
                
                VStack(alignment: .leading) {
                    Text("experience")
                        .customFont(.caption1)
                    Text("\(experience)" + " years+")
                        .fontWeight(.medium)
                        .customFont(.caption2)
                        // fixed text only 1 line , and display normal
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: true)
                }
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
        }
        .frame(maxWidth: 129)
    }
}

struct YourAppointmentRowView: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Your Appointment")
                    .fontWeight(.heavy)
                    .customFont(.title3)
                
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("see all")
                        .customFont(.subheadline)
                        .foregroundColor(Color("main"))
                })
            }
            
            VStack(spacing: -160) {
                ForEach(0..<vm.appointment.count) { i in
                    
                    if i == 1 {
                        DoctorCardView(index: i)
                            .scaleEffect(0.9)
                            //.scaleEffect(CGFloat(1 - (i / 10)*4))
                            .environmentObject(vm)
                    } else if i == 2 {
                        DoctorCardView(index: i)
                            .scaleEffect(0.95)
                            .environmentObject(vm)
                    } else {
                        DoctorCardView(index: i)
                            .scaleEffect(0.85)
                            .environmentObject(vm)
                    }
                }
            }
            .offset(y: 20)
            
            
        }
    }
}

struct DoctorCardView: View {
    
    @EnvironmentObject var vm: MainViewModel
    var index: Int = 0
    
    var body: some View {
        ZStack {
            
            Color("main")
                .frame(width: 305, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 1)
            VStack(spacing: 15) {
                HStack {
                    Image("DoctorCard1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 53, height: 53)
                    
                    VStack(alignment: .leading) {
                        Text(vm.appointDoctor[index].name)
                            .customFont(.subheadline)
                            .foregroundColor(.white)
                        Text(vm.appointDoctor[index].type)
                            .customFont(.callout)
                            .foregroundColor(.white)
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.orange)
                            Text("\(vm.appointDoctor[index].rating, specifier: "%.1f")")
                                .customFont(.callout)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 104, height: 53)
                    
                }
                .frame(width: 265, height: 53)
               // .fixedSize()
               // .offset(y: -20)
                
                HStack {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                        .foregroundColor(.white)
                    
                    Text(vm.appointment[index].date, style: .date)
                        .foregroundColor(.white)
                    Text(",")
                        .foregroundColor(.white)
                    Text(vm.appointment[index].date, style: .time)
                        .foregroundColor(.white)
                }
                .customFont(.subheadline)
                .frame(width: 274, height: 52)
                .clipShape(RoundedRectangle(cornerRadius: 13))
                .background(Color("field").opacity(0.1))
            }
            .frame(width: 305)
        }
        
    }
}
