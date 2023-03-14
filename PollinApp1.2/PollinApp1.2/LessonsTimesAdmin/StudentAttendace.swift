//
//  StudentAttendace.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 4.03.2023.
//

import SwiftUI

struct StudentAttendace: View {
    
    @State var useColor  =  LinearGradient(colors: [.blue.opacity(0.2),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
    @ObservedObject var courseComputer = Course()
    
    @StateObject var user = User()
    @StateObject var students = Student()
    //@StateObject var courseComputer = Course()
    // Sadece tıklanılan dersleri göstermek için ders almam lazim.
    
    @State var receiveCourse     : String
    @State var receiveWeek       : String // The selected we receive from "WeekView".
    @State var receiveDepartmant : String // The selected we receive from "AdminLogin".
    
    var body: some View{
        NavigationStack{
            List{
                Section(header: Text("Students Number") .foregroundColor(.purple.opacity(0.75))){
                    ForEach(students.students,id: \.self){item in
                        ForEach(item.selectedLessons!,id:\.self){name in
                            if name == receiveCourse{
                                Text(item.studentNo!)
                            }
                        }
                    }
                }

            }
        }
    }
}

struct StudentAttendace_Previews: PreviewProvider {
    static var previews: some View {
        StudentAttendace(receiveCourse: "" ,receiveWeek: "",receiveDepartmant: "")
    }
}
