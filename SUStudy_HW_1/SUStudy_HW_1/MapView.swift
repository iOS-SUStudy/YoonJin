//
//  MapView.swift
//  SUStudy_HW_1
//
//  Created by 이윤진 on 2020/08/20.
//  Copyright © 2020 이윤진. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context){
        let coordinate = CLLocationCoordinate2D( latitude: 37.5064194, longitude: 127.012029) // 좌표값
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005) // 확대값 설정, 값 작아질 수록 확대
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
