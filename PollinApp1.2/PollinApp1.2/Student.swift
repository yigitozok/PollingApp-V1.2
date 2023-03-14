//
//  Student.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 15.02.2023.
//

import Foundation

class Student : ObservableObject{
    @Published var students = [StudentFeatures](){
        didSet{
            let encoder = JSONEncoder()
            if let encoder = try? encoder.encode(students){
                UserDefaults.standard.set(encoder, forKey: "log2")
            }
        }
    }
    init(){
    
        if let readItems = UserDefaults.standard.data(forKey: "log2"){
            if let decoded = try? JSONDecoder().decode([StudentFeatures].self, from: readItems){
                students = decoded
                return
            }
            students = []
        }
    }
}
