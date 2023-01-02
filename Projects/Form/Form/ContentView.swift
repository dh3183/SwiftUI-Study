//
//  ContentView.swift
//  pract
//
//  Created by 한빈 on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    @State var toggling = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink(destination: Text("Apple ID")) {
                        Image("blue")
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 60, height: 60)
                        VStack(alignment: .leading) {
                            Text("엘빈")
                                .font(.title2)
                            Text("Apple ID, iCloud+, 미디어 및 구입 항목")
                                .font(.system(size: 12))
                        }
                    }
                }
                Section("Section1") {
                    HStack {
                        Image(systemName: "airplane")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 240/255, green: 154/255, blue: 55/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Toggle(isOn: $toggling){
                            Text("에어플레인 모드")
                        }
                    }
                    NavigationLink(destination: Text("Wi-Fi 화면")) {
                        Image(systemName: "wifi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 52/255, green: 120/255, blue: 246/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Text("Wi-Fi")
                    }
                    NavigationLink(destination: Text("셀룰러 화면")) {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 101/255, green: 196/255, blue: 102/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Text("셀룰러")
                    }
                }
                Section("Section2") {
                    NavigationLink(destination: Text("알림 화면")) {
                        Image(systemName: "bell.badge.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 234/255, green: 78/255, blue: 61/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Text("알림")
                    }
                    NavigationLink(destination: Text("사운드 및 햅틱 화면")) {
                        Image(systemName: "speaker.wave.3.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 234/255, green: 68/255, blue: 90/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Text("사운드 및 햅틱")
                    }
                    NavigationLink(destination: Text("집중모드 화면")) {
                        Image(systemName: "moon.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 87/255, green: 86/255, blue: 206/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Text("집중모드")
                    }
                    NavigationLink(destination: Text("스크린 타임 화면")) {
                        Image(systemName: "hourglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(4)
                            .background(Color(red: 87/255, green: 86/255, blue: 206/255))
                            .foregroundStyle(.white)
                            .cornerRadius(6)
                        Text("스크린 타임")
                    }
                }
            }
            .navigationTitle("설정")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
