//
//  ContentView.swift
//  Aggressiweet
//
//  Created by Yogesh Sehgal on 24/07/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import Combine

struct ContentView: View {
    @State var query = ""
    @State var text = ""
    @State var result : String = ""
    @ObservedObject var value : Value = Value()
    var body: some View {
        TabView() {
            ScrollView {
                    VStack {
                        Group {
                            VStack {
                                Spacer()
                                    TextField("Analyse Tweets by Typing Here", text: $query)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding()
                        Group {
                            Button(action: {
                                print("Button Tapped")
                                fetch(query: self.query)
                                }) {
                                    Text("Analyse")
                                    .padding()
                                    .foregroundColor(.blue)
                                    .background(Color.white)
                                    .cornerRadius(.infinity)
                                }
                                }.padding()
                            PieChartView(data: [Double(self.value.cag),Double(self.value.oag),Double(self.value.nag)], title: "Aggression", legend: "Tap to Update",dropShadow: false).onTapGesture {
                                self.value.updateData()
                            }
                            VStack{
                                    Text("Covertly-Aggressive: \(self.value.cag)").foregroundColor(.white)
                                    Text("Overtly-Aggressive: \(self.value.oag)").foregroundColor(.white)
                                    Text("Non-Aggressive: \(self.value.nag)").foregroundColor(.white)
                            }.padding()
                    }.padding()
                    }.offset(y:100)
            }.background(Color.blue).edgesIgnoringSafeArea(.all).tabItem {
              Image(systemName: "square.and.arrow.down.fill")
              Text("Twitter")
        }
            VStack{
                Spacer()
                VStack{
                    TextField("Analyse Custom Text", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding()
                VStack{
                    Button(action: {
                    print("Button Tapped")
                        self.result=text_analyse(analyse: self.text)
                    }) {
                        Text("Analyse")
                        .padding()
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .cornerRadius(.infinity)
                    }
                }.padding()
                Text(result).padding().font(.largeTitle).foregroundColor(.white)
                Spacer()
            }.background(Color.blue).edgesIgnoringSafeArea(.all).tabItem {
              Image(systemName: "text.bubble.fill")
              Text("Text")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }

}


