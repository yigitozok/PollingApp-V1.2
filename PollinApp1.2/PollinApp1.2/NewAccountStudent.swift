//
//  NewAccountStudent.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 15.02.2023.
//

import SwiftUI

struct NewAccountStudent: View {
    
    @StateObject var student2 = Student()
   
    @State private var studentNo     :  String   = ""
    @State private var password      :  String   = ""
    @State private var departmant    :  String   = ""
    @State private var lessonList    : [String]  = []
    
    @State private var isPresentedAlert : Bool = false
    @State private var isPresentPass    : Bool = false
    
    
    let departmans = ["Computer","Electrical and Electronic",
                      "Machine","Civil","Industry","Mechatronics","Software"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("User No :"  ,text: $studentNo)
                TextField("Password  :",text: $password )
                Picker   ("Departman :",selection: $departmant){
                    
                    ForEach(departmans,id: \.self){
                        Text($0)
                    }
                    
                }.pickerStyle(.navigationLink)
            }
            .navigationTitle("New acount")
            .toolbar{
                    Button(action: {
                        
                        for item in student2.students{
                            print(item)
                            if item.studentNo == studentNo{
                                print(1)
                                isPresentedAlert = true
                            }
                        }
                        
                        if isPresentedAlert == false{
                            let newUser = StudentFeatures(studentNo: studentNo,password: password,departman: departmant,selectedLessons: lessonList)
                            student2.students.append(newUser)
                            isPresentPass = true
                        }
                    },  label: {Text("Save")})
                    
                    .alert("Warning", isPresented: $isPresentedAlert){
                        Button("Ok",role: .cancel){}
                    }message: {
                        Text("This account is already registered")
                    }
                    .navigationDestination(isPresented: $isPresentPass){
                        StudentLogin()
                    }
            }
        }
    }
}

struct NewAccountStudent_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountStudent()
    }
}
