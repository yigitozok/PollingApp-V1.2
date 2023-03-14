//
//  DaysViewAdmin.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 5.03.2023.
//

import SwiftUI

struct Day2 : Identifiable{
    var id = UUID()
    var dayName : String
    var isActive : Bool
}
struct DaysViewAdmin : View{
    //When I click on the days , the status of the page's page
    @State var days : [Day2] = [Day2(dayName: "Monday", isActive: false),Day2(dayName: "Tuesday", isActive: false),Day2(dayName: "Wednesday", isActive: false),Day2(dayName: "Thursday", isActive: false),Day2(dayName: "Friday", isActive: false)]
    
    @State private var isPresentedDayDetail : Bool = false
    @StateObject var courseComputer = Course()
    
    
    @State var receiveDepartmant :  String // The data we receive from "AdminLogin".
    @State var receiveCourse     :  String // The selected course from "AdminCourses || StudentCourses" view.
    @State var receiveWeek       :  String // The selected view from "WeekView view .
    
    @State var selectedTeacherName : String = ""
    
    @State var tempLessonDayName = [String:Int]()
    @State var isPresentedAlert  : Bool = false
    
    
    
    @State var dayDetailViews: [DaysDetailView] = []
    //@StateObject var courseComputer = Course()
    
    @State var dayName1 : String = ""
    @State var dayName2 : String = ""
    
    @State var lessonTime1 = [String]()
    @State var lessonTime2 = [String]()
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.5),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    Spacer().frame(height: 27)
                    HStack{
                        Text(receiveWeek)
                            .padding()
                            .font(.system(size: 32,weight: .semibold))
                        Spacer()
                    }
                    Spacer()
                    ScrollView(showsIndicators: false){
                        VStack(alignment: .center,spacing: 20){
                            ForEach($days){$item in
                                Button(action: {
                                    withAnimation {
                                        //when I press the days, the emergence of lessons ;
                                        item.isActive.toggle()
                                        //We did it to check whether the lessons were on the selected days.
                                        for course in courseComputer.coursesCompuer{
                                            if course.lessonName == receiveCourse {
                                                
                                                dayName1 = Array(course.lessonDayTimes.keys)[0]
                                                dayName2 = Array(course.lessonDayTimes.keys)[1]
                                                
                                                lessonTime1 = course.lessonDayTimes[dayName1]!
                                                lessonTime2 = course.lessonDayTimes[dayName2]!
                                                print(dayName1)
                                                print(dayName2)
                                                print(lessonTime1)
                                                print(lessonTime2)
                                                selectedTeacherName = course.lessonTeacherName
                                                
                                                if item.dayName == dayName1{
                                                    isPresentedAlert = false
                                                }
                                                else if item.dayName == dayName2{
                                                    isPresentedAlert = false
                                                }
                                                else{
                                                    isPresentedAlert = true
                                                }
                                                
                                            }
                                            
                                        }
                                    }
                                    
                                },label: {
                                    Text(item.dayName)
                                        .font(.system(size: 20,weight: .medium))
                                        .frame(width: 350,height: 35)
                                        .foregroundColor(.black)
                                        .background(Color.blue.opacity(0.1))
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                        .background(
                                            RoundedRectangle(cornerRadius: 25)
                                                .stroke(LinearGradient(gradient: .init(colors:[
                                                    Color(.blue).opacity(0.5),
                                                   
                                                    Color(.purple).opacity(0.7),
                                                    
                                                    Color(.blue).opacity(0.5),
                                                ]),startPoint: .topLeading,endPoint: .bottomTrailing)
                                                        ,lineWidth: 1.9)
                                                .padding(0.7))
                                        
                                    
                                }).alert("Warning!", isPresented: $isPresentedAlert){
                                    Button("Ok"){}
                                }message:{
                                    Text("You have no lessons for today")
                                }
                                if item.isActive && item.dayName == dayName1{
                                    
                                    ForEach(0..<lessonTime1.count,id: \.self){indeks in
    
                                        withAnimation{
                                            DaysDetailViewAdmin(receiveTeacherName: selectedTeacherName, reveiceLessonDayTimes:lessonTime1[indeks], receiveLessonName: receiveCourse,receiveWeek: receiveWeek,receiveDepartmant: receiveDepartmant)
                                                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                                        }
                                    }
                                }
                                else if item.isActive && item.dayName == dayName2{
                                    ForEach(0..<lessonTime2.count,id: \.self){indeks in
                                        withAnimation{
                                            DaysDetailViewAdmin(receiveTeacherName: selectedTeacherName, reveiceLessonDayTimes:lessonTime2[indeks], receiveLessonName: receiveCourse,receiveWeek:receiveWeek,receiveDepartmant:receiveDepartmant)
                                                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                                        }
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }.toolbar{
                Text("Save")
            }
        }
    }
}


struct DaysViewAdmin_Previews: PreviewProvider {
    static var previews: some View {
        DaysView(receiveDepartmant:"" ,receiveCourse: "",receiveWeek: "")
    }
}
