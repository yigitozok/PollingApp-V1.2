//
//  ContentView.swift
//  PollinApp1.2
//
//  Created by Emre Gülkanat on 12.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.5),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack(spacing: 125){
                    VStack(spacing: 25){
                        Text("Poll")
                            .font(.largeTitle)
                            .fontDesign(.monospaced)
                        Image(systemName: "checkmark.rectangle.portrait")
                            .resizable()
                            .frame(width: 100,height: 100)
                            .foregroundColor(Color.blue)
                            
                    }
                    VStack(spacing: 30){
                        NavigationLink(destination: AdminLogin()){
                            
                            //AdminLogin view'ımzda bulunan item'i kullanmasını sağlamak için bu şekilde tanımladık.
                            Text("Admin Login")
                                .frame(width: 320,height: 60)
                                .font(.system(size: 30 ,weight: .light))
                                .background(Color.gray.opacity(0.1))
                                .foregroundColor(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(LinearGradient(gradient: .init(colors:[
                                            Color(.blue).opacity(0.7),
                                            Color(.purple).opacity(0.5),
                                            Color(.blue).opacity(0.7),
                                        ]),startPoint: .topLeading,endPoint: .bottomTrailing)
                                                ,lineWidth: 1.9)
                                        .padding(0.7)
                                )
                                .shadow(radius:10)
                                
                                
                        }
                        NavigationLink(destination: StudentLogin()){
                            
                            Text("Student Login ")
                                .frame(width: 320,height: 60)
                                .font(.system(size: 30 ,weight: .light))
                                .background(Color.gray.opacity(0.1))
                                .foregroundColor(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(LinearGradient(gradient: .init(colors:[
                                            Color(.blue).opacity(0.7),
                                            Color(.purple).opacity(0.5),
                                            Color(.blue).opacity(0.7),
                                        ]),startPoint: .topLeading,endPoint: .bottomTrailing)
                                                ,lineWidth: 1.9)
                                        .padding(0.7)
                                )
                                .shadow(radius:10)
                        }
                    }
                    
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
