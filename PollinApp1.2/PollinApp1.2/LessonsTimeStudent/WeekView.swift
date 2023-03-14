//
//  WeekView.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 20.02.2023.
//

import SwiftUI

struct WeekView : View{
    
    //When I click on the week , the status of the page's page
    let columns : [GridItem] = [GridItem(.fixed(175)),GridItem( .fixed(175))]
    
    let weeks : [String] = ["Week1","Week2","Week3","Week4","Week5","Week6","Week7","Week8","Week9","Week10"]
    
    @ObservedObject var courses = Course()
    @State var selectedDepartmant : String // The data we receive from "AdminLogin".
    @State var selectedCourses    : String // The data we receive from "AdminCourses".
    

    var body: some View{
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.5),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            LazyVGrid(columns: columns,spacing: 35){
                ForEach(weeks,id: \.self) { week in
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .opacity(0.2)
                            .background(
                            Color
                                .white
                                .opacity(0.08)
                                .blur(radius: 10))
                            //Strokes
                                .background(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(LinearGradient(gradient: .init(colors:[
                                            Color(.blue),
                                            Color(.purple).opacity(0.2),
                                            .clear,
                                            .clear,
                                            Color(.blue).opacity(0.8),
                                        ]),startPoint: .topLeading,endPoint: .bottomTrailing)
                                                ,lineWidth: 1.9).padding(0.7)
                                )
                        VStack(alignment: .leading){
                            HStack{
                                NavigationLink(destination: DaysView(receiveDepartmant:selectedDepartmant,receiveCourse: selectedCourses,receiveWeek: week),
                                        label: {
                                            Text(week)
                                                .foregroundColor(.black)
                                                .font(.system(size: 17))
                                                .padding()
                                        }
                                    )
                                
                                Spacer()
                            }
                            HStack{
                                Text("10/02/22")
                                    .font(.system(size: 11,weight: .light))
                                Text("17/02/22")
                                    .font(.system(size: 11,weight: .light))
                            }
                            .offset(x:15,y:-13)
                            VStack(alignment: .leading){
                                Text("Notification:")
                                    .font(.system(size: 10))
                                Text("Homework & Project")
                                    .font(.system(size: 10))
    
                            }
                            .offset(x:15,y:-3)
                            Spacer()
                            }
                        }
                    }
                }
            }.navigationTitle("Weeks")
                
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    
    static var previews: some View {
        WeekView(selectedDepartmant: "",selectedCourses: "")
    }
}
