//
//  ContentView.swift
//  Weather
//
//  Created by Jaison Zachariah on 14/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "New York")
                WeatherHighLightView(isNight: $isNight, temperature: 76)
                HStack(spacing: 2){
                    WeatherDayView(dayName: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayName: "WED", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayName: "THU", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayName: "FRI", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayName: "SAT", imageName: "cloud.sun.fill", temperature: 76)
                }
                Spacer()
                Button{
                    isNight.toggle()
                }label: {
                    WeatherButton(title: "Change day of the week", backgroundColor: Color.white, foregroundColor: Color.blue)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayName: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayName)
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(Color.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 18, weight: .medium, design: .default))
                .foregroundColor(Color.white)
                .padding()
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient.init(colors: [ isNight ? Color.black : Color.blue, isNight ? Color.gray : Color("lighblue")], startPoint: .topLeading,
                            endPoint: .bottomTrailing).ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(Color.white)
            .padding()
    }
}

struct WeatherHighLightView: View {
    @Binding var isNight: Bool
    var temperature: Int
  
    var body: some View {
        VStack(spacing: 2){
            Image(systemName: isNight ? "moon.stars.fill":"cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(Color.white)
                .padding()
        }
    }
}
