//
//  NewAccount.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 12.02.2023.
//

import SwiftUI

struct NewAccount: View {
    
    @StateObject var user2 = User()

    @State private var userName     :  String   = ""
    @State private var password     :  String   = ""
    @State private var departmant   :  String   = ""
    @State private var lessonList   : [String]  = []
    
    @State private var isPresentedAlert : Bool = false
    @State private var isPresentPass    : Bool = false
    
    
    let departmans = ["Computer","Electrical and Electronic",
                      "Machine","Civil","Industry","Mechatronics","Software"]
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("User Name :",text: $userName)
                TextField("Password  :",text: $password)
                Picker   ("Departman :",selection: $departmant){
                    ForEach(departmans,id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.navigationLink)
                
            }
            .navigationTitle("New acount")
            .toolbar{
                    Button(action: {
                        
                        for item in user2.users{
                            print(item)
                            if item.userName == userName{
                                print(1)
                                isPresentedAlert = true
                            }
                        }
                        if isPresentedAlert == false{
                            let newUser = UserFeature(userName: userName,password: password,departman: departmant,selectedLessons: lessonList)
                            user2.users.append(newUser)
                            isPresentPass = true
                        }
                    },  label: {Text("Save")})
                    
                    .alert("Warning", isPresented: $isPresentedAlert){
                        Button("Ok",role: .cancel){}
                    }message: {
                        Text("This account is already registered")
                    }
                    .navigationDestination(isPresented: $isPresentPass){
                        AdminLogin()
                    }
            }
        }
    }
}

struct NewAccount_Previews: PreviewProvider {
   
    static var previews: some View {
        NewAccount()
    }
}
