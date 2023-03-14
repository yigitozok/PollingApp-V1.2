//
//  UserFeature.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 15.02.2023.
//

import Foundation

struct UserFeature : Codable , Hashable{
    var id = UUID()
    //var userType : In
    var userName  :  String?
    var password  :  String?
    var departman :  String?
    var selectedLessons : [String]?
}
struct LessonFeatures2 : Codable , Hashable{
 var lessonName         :  String
 var registeredStudents : [String]?
}
