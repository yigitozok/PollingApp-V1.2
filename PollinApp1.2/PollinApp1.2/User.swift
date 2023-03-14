//
//  User.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 12.02.2023.
//

import Foundation
class User : ObservableObject{
    @Published var users = [UserFeature](){
        
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(users){
                UserDefaults.standard.set(encoded, forKey: "log1")
            }
        }
    }
    init(){
    
        if let readItems = UserDefaults.standard.data(forKey: "log1"){
            if let decoded = try? JSONDecoder().decode([UserFeature].self, from: readItems){
                users = decoded
                return
            }
            users = []
        }
    }
}
