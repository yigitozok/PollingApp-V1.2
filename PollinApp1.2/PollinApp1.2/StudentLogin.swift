//
//  StudentLogin.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 15.02.2023.
//

import SwiftUI

struct StudentLogin: View {
    
    @StateObject var student = Student()
  
    @State var studentNo             :  String  = ""
    @State var selectedDepartmant    :  String  = ""
    @State var listLesson            : [String] = []
    
    @State private var password      :  String  = ""
    
    @State private var isPresentedNewAccount : Bool   = false
    //If it is already registered, the user allows the alert to work
    @State private var isPresentedAllert     : Bool   = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.5),.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        VStack(alignment: .leading,spacing: 5){
                            Text("Welcome Back!")
                                .font(.system(size: 32,weight: .bold))
                            Text("Enter Your Student No & Passoword")
                                .font(.system(size: 18,weight: .semibold))
                                .foregroundColor(.black.opacity(0.5))
                        }
                        Spacer().frame(width:50)
                    }
                    Spacer().frame(height: 100)
                    VStack{
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 80,height: 90)
                        Text("Student Panel")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        TextField("Student No :",text: $studentNo)
                            .padding()
                            .background(.gray.opacity(0.1))
                        SecureField("Password :",text: $password)
                            .padding()
                            .background(.gray.opacity(0.1))
                    }
                    Spacer().frame(height: 75)
                    
                    VStack(spacing: 15){
                        Button(action: {
                            isPresentedNewAccount = isEnter()
                            if isPresentedNewAccount == true{
                                for item in student.students{
                                    print(item)
                                    if item.studentNo == studentNo{
                                        listLesson = item.selectedLessons   ?? []
                                        selectedDepartmant = item.departman ?? ""
                                    }
                                }
                            }else{
                                isPresentedAllert = true
                            }
                            
                        },label: {Image(systemName:"arrowshape.right")
                                .frame(width: 80,height: 25)
                                .background(.gray.opacity(0.1))
                                .foregroundColor(.purple.opacity(0.8))
                                .clipShape(Capsule())
                                .background(
                                    Capsule()
                                        .stroke(LinearGradient(gradient: .init(colors:[
                                            Color(.blue).opacity(0.7),
                                            Color(.purple).opacity(0.5),
                                            Color(.blue).opacity(0.7),
                                        ]),startPoint: .topLeading,endPoint: .bottomTrailing)
                                                ,lineWidth: 1.9)
                                        .padding(0.7)
                                )
                        }).alert("Something is Wrong", isPresented: $isPresentedAllert){
                            Button("Ok",role: .cancel){}
                        }message: {
                            Text("Username or password incorrect!")
                        }
                        .navigationDestination(isPresented: $isPresentedNewAccount){
                            StudentCourses(lessonList: $listLesson, selectedStudentNo: $studentNo, selectedDepartmant: $selectedDepartmant)
                        }
                        NavigationLink{
                            NewAccountStudent()
                        }label: {
                            Text("You don't have an account ?")
                                .font(.headline)
                                .foregroundColor(.purple.opacity(0.8))
                        }
                    }
                }
            }
        }
    }
    //Check the student has been registered before.
    func isEnter() -> Bool{
        for item in student.students{
            print(item)
            if item.studentNo == studentNo && item.password == password{
                return true
            }
        }
        return false
    }
}

struct StudentLogin_Previews: PreviewProvider {
    static var previews: some View {
        StudentLogin()
    }
}
