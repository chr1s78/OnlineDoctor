//
//  DoctorDetail.swift
//  OnlineDoctor
//
//  Created by 吕博 on 2021/7/24.
//

import SwiftUI
import MapKit

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}

struct DoctorDetailView: View {
    
    var doctorInfo: DoctorSimpleInfo
    
    var body: some View {
        
        ZStack {
            
            Color("background").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    DoctorDetailHeaderView(doctorInfo: doctorInfo)
                        .padding(.top, 90)
                    
                    Divider()
                    
                    HStack {
                        Text("Upcoming Schedule")
                            .fontWeight(.semibold)
                            .customFont(.title2)
                           
                        Spacer()
                    }
                    
                    DoctorCardPart(doctorInfo: doctorInfo)
                    
                    DoctorDetailBiographyPart()
                    
                }
                .frame(width: 305)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .CustomNavigationButtonStyle()
    }
}

struct DoctorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailView(doctorInfo: DoctorSimpleInfo(id: 1, photo: "Doctor1", rating: 4.9, experience: 8, name: "Dr.Samantha", type: "Cardiologist", address: "", date: Date(timeIntervalSinceNow: 4000)))
    }
}

struct DoctorDetailBiographyPart: View {
    
    @State var show: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Biography")
                .fontWeight(.semibold)
                .customFont(.title2)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet phasellus a enim sed. Sit mattis sed hac turpis")
                .customFont(.subheadline)
                .truncationMode(.tail)
                .lineLimit(show ? nil : 2)
            
            HStack {
                Spacer()
                Button(action: { self.show.toggle() }, label: {
                    Text(show ? "fold" : "Read More")
                        .fontWeight(.semibold)
                        .customFont(.subheadline)
                })
                .padding(.horizontal)
            }
        }
    }
}

struct DoctorDetailHeaderView: View {
    
    var doctorInfo: DoctorSimpleInfo
    @State var coordinateRegion: MKCoordinateRegion = {
        var newRegion = MKCoordinateRegion()
        newRegion.center.latitude = 37.786996
        newRegion.center.longitude = -122.440100
        newRegion.span.latitudeDelta = 0.1
        newRegion.span.longitudeDelta = 0.1
        return newRegion
    }()
    
    var annotationItems: [MyAnnotationItem] = [
        MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.786996, longitude: -122.440100)),
    ]
    
    var body: some View {
        HStack(alignment: .bottom) {
            Image(doctorInfo.photo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 28))
                .shadow(color: Color(#colorLiteral(red: 0.3137254902, green: 0.3803921569, blue: 1, alpha: 0.03300880281)), radius: 40, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 7)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text(doctorInfo.name)
                        .fontWeight(.semibold)
                        .customFont(.title2)
                    Text(doctorInfo.type)
                        .customFont(.subheadline)
                    
                    RatePart(rating: doctorInfo.rating)
                    
                    ExperiencePart(experience: doctorInfo.experience)
                }
                .padding(.horizontal)
                
                Map(coordinateRegion: $coordinateRegion,
                    annotationItems: annotationItems) {item in
                    MapPin(coordinate: item.coordinate)
                }
                .frame(width: 122, height: 122)
                .clipShape(RoundedRectangle(cornerRadius: 28))
            }
        }
        .frame(height: 237)
    }
}
