//
//  SearchDoctorView.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/23.
//

import SwiftUI
struct SearchDoctorView: View {
    
    @EnvironmentObject var vm: MainViewModel
    @State var isEditing: Bool = false
    @State var searchText: String = ""
    
    init() {
        // set navigation bar transparent
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color("background").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // Search Bar Row
                HStack {
                    SearchBar(text: $searchText)
                }
                
                .padding(.top, 40)
                
                VStack {
                    HStack {
                        Text("All Doctors")
                            .fontWeight(.bold)
                            .customFont(.title3)
                        Spacer()
                    }
                    
                    ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                        ForEach(vm.data.filter({
                            searchText.isEmpty ? true : $0.name.contains(searchText)
                        })) { doctor in
                            DoctorListRow(info: doctor)
                        }
                    }
                }
                .padding(.top, 40)
                Spacer()
            }
            .frame(width: 304)
        }
        .navigationBarTitle("Find Your Doctor", displayMode: .inline)
        .CustomNavigationButtonStyle()
    }
}

struct SearchDoctorView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDoctorView()
            .environmentObject(MainViewModel())
    }
}

struct DoctorListView: View {
    
    @EnvironmentObject var vm: MainViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                Text("All Doctors")
                    .fontWeight(.bold)
                    .customFont(.title3)
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                ForEach(vm.data) { doctor in
                    DoctorListRow(info: doctor)
                }
            }
        }
    }
}

struct DoctorListRow: View {
    
    var info: DoctorSimpleInfo
    
    var body: some View {
        ZStack {
            Color("field").clipShape(RoundedRectangle(cornerRadius: 23))
            
            VStack {
    
                HStack {
                    Image("DocList1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 53, height: 53)
                        .padding(.leading, 8)
                    
                    VStack(alignment: .leading) {
                        Text(info.name)
                            .customFont(.subheadline)
                            .foregroundColor(.black)
                        Text(info.type)
                            .customFont(.callout)
                            .foregroundColor(.black)
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10, height: 10)
                                .foregroundColor(.orange)
                            Text("\(info.rating, specifier: "%.1f")")
                                .customFont(.callout)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer()
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 104, height: 53)
                        .padding(.trailing, 8)
                }
            }
        }
        .frame(height: 70)
    }
}
