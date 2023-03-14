//
//  StudentCourses.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 15.02.2023.
//

import SwiftUI

struct StudentCourses: View {
    
    @StateObject var student = Student()
    @StateObject var courseComputer = Course()
    @StateObject var user = User()
    
    @State var lesson     : String = ""
   
    //These data we receive from "StudentLogin".
    //We have defined "@Binding" because the data will receive
    //from "Login View" is constantly changing
    @Binding var lessonList          : [String]
    @Binding var selectedStudentNo   :  String
    @Binding var selectedDepartmant  :  String
    
    @State var useColor  =  LinearGradient(colors: [.blue.opacity(0.2),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.5),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                List{
                    Section(header: Text("Available Courses")
                        .foregroundColor(.purple.opacity(0.75))){
                        ForEach(lessonList,id:\.self){item in
                            NavigationLink(destination: WeekView(selectedDepartmant:selectedDepartmant, selectedCourses: item),
                                label: {Text(item)})
                            .listRowBackground(useColor)
                        }
                        .onDelete(perform: removeLesson)
                        .swipeActions(edge:.leading,allowsFullSwipe: true){
                            Button(action: {}, label: {
                                Label("Favorite",systemImage: "star")
                            })
                        }
                        .listRowSeparatorTint(.purple)
                    }
                    Section(header: Text("Add New Courses")
                    .foregroundColor(.purple.opacity(0.75))){
                    if selectedDepartmant == "Computer"{
                        Picker("Lessons",selection: $lesson){
                            ForEach(courseComputer.coursesCompuer,id: \.lessonName){item in
                                   Text(item.lessonName)
                            }
                        }
                        .listRowBackground(useColor)
                        .pickerStyle(.navigationLink)
                    }
                    else if selectedDepartmant == "Electrical and Electronic" {
                        Picker("Lessons",selection: $lesson){
                            ForEach(coursesElectrical,id:\.self){item in
                                Text(item)
                            }
                        }
                        .listRowBackground(useColor)
                        .pickerStyle(.navigationLink)
                    }
                }
                Button(action: {
                    lessonList.append(lesson)
                   
                    for (index, item) in student.students.enumerated() {
                        if item.studentNo == selectedStudentNo {
                            var updatedUser = item
                            updatedUser.selectedLessons = lessonList
                            student.students[index] = updatedUser
                            print(item)
                        }
                    }
                    
                    
                },label: {HStack{
                        Text("Add selected lesson").foregroundColor(Color.purple.opacity(0.75))
                        Spacer()
                        Text("\(lesson)").foregroundColor(Color.black.opacity(0.5))
                }
                }).listRowBackground(useColor)
                }
            }
            .toolbar{
               EditButton()
            }
        }
    }
    func removeLesson(offsets : IndexSet){
        lessonList.remove(atOffsets: offsets)
           for (index, item) in student.students.enumerated() {
               if item.studentNo == selectedStudentNo {
                   var updatedUser = item
                   updatedUser.selectedLessons = lessonList
                   student.students[index] = updatedUser
                   print(item)

                   
               }
           }
    }
}

struct StudentCourses_Previews: PreviewProvider {
    
    @State static var selectedDepartmant   :  String   = ""
    @State static var selectedStudentNo    :  String   = ""
    @State static var selectedListlessons  : [String]  = []
    
    static var previews: some View {
        StudentCourses(lessonList: $selectedListlessons, selectedStudentNo: $selectedStudentNo, selectedDepartmant: $selectedDepartmant)
    }
}


