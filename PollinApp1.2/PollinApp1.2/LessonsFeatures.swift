//
//  Lessons.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 12.02.2023.
//

import Foundation
struct LessonDayNameFeatures  : Codable , Hashable{
    
    var id = UUID()
    var lessonName        :  String
    var lessonDayTimes    : [String :[String]]
    var lessonTeacherName :  String
    var registeredStudents: [String]
    
    
    var lessonDayName  : [String]{
        return Array(lessonDayTimes.keys)

    }
    
    var sumLessonTime  : [[String]]{
        return Array(lessonDayTimes.values)
    }
  
}
class Course : ObservableObject{
    var coursesCompuer   : [LessonDayNameFeatures] = [
        LessonDayNameFeatures(lessonName:"Ceng105",lessonDayTimes:["Monday"   :["09:20-10:10","10:20-11:10"],"Thursday":["16:20-17:10"]],lessonTeacherName:"Murat Saran",registeredStudents:["10"]),
        LessonDayNameFeatures(lessonName:"Ceng111",lessonDayTimes:["Monday"   :["10:20-11:10"],"Wednesday":["15:20-16:10","16:20-17:10"]],lessonTeacherName:"Gül Tokdemir" ,registeredStudents:["10"]),
        LessonDayNameFeatures(lessonName:"Ceng114",lessonDayTimes:["Tuesday"  :["10:20-11:10","11:20-12:10"],"Thursday":["11:20-12:10","12:20-13:10"]],lessonTeacherName:"Gül Tokdemir",registeredStudents:["10"]),
        LessonDayNameFeatures(lessonName:"Ceng124",lessonDayTimes:["Wednesday":["15:20-16:10"],"Friday":["09:20-10:10"]],lessonTeacherName:"Nurdan Saran",registeredStudents:["10"]),
        LessonDayNameFeatures(lessonName:"Ceng241",lessonDayTimes:["Monday"   :["09:20-10:10"],"Thursday":["11:20-12:10","13:20-14:10"]],lessonTeacherName:"Serdar Arslan",registeredStudents:["10"]),
        LessonDayNameFeatures(lessonName:"Ceng235",lessonDayTimes:["Monday"   :["11:20-12:10","13:20-14:10"] ,"Wednesday":["13:20-14:10"]],lessonTeacherName:"Nurdan Saran",registeredStudents:["10"]),
        LessonDayNameFeatures(lessonName:"Ceng218",lessonDayTimes:["Tuesday"  :["09:20-10:10"],"Thursday":["11:20-12:10","12:20-13:10"]],lessonTeacherName:"Ahmet Coşar" ,registeredStudents:["11"]),
        LessonDayNameFeatures(lessonName:"Ceng222",lessonDayTimes:["Tuesday"  :["11:20-12:10","12:20-13:10","13:20-14:10"],"Wednesday":["12:20-13:10"]],lessonTeacherName:"Faris Serdar Taşel",registeredStudents:["11"]),
        LessonDayNameFeatures(lessonName:"Ceng236",lessonDayTimes:["Wednesday":["10:20-11:10"],"Friday":["09:20-10:10","10:20-11:10","11:20-12:10"]],lessonTeacherName:"Nurdan Saran",registeredStudents:["11"]),
        LessonDayNameFeatures(lessonName:"Ceng383",lessonDayTimes:["Monday"   :["11:20-12:10","12:20-13:10"] ,"Friday":["09:20-10:10","10:20-11:10"]],lessonTeacherName:"Ahmet Coşar",registeredStudents:["11"]),
        LessonDayNameFeatures(lessonName:"Ceng466",lessonDayTimes:["Tuesday"  :["09:20-10:10"],"Friday":["11:20-12:10","12:20-13:10"]],lessonTeacherName:"Serdar Arslan",registeredStudents:["11"]),
        LessonDayNameFeatures(lessonName:"Ceng329",lessonDayTimes:["Monday"   :["11:20-12:10","12:20-13:10","13:20-14:10"],"Thursday":["09:20-10:10"]],lessonTeacherName:"Faris Serdar Taşel",registeredStudents:["11"]),
        LessonDayNameFeatures(lessonName:"Ceng382",lessonDayTimes:["Wednesday":["10:20-11:10"],"Thursday":["11:20-12:10","12:20-13:10"]],lessonTeacherName:"Murat Saran",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng328",lessonDayTimes:["Tuesday"  :["09:20-10:10","10:20-11:10"] ,"Wednesday":["09:20-10:10"]],lessonTeacherName:"Serdar Arslan",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng356",lessonDayTimes:["Tuesday"  :["09:20-10:10"],"Wednesday":["11:20-12:10","12:20-13:10"]],lessonTeacherName:"Ahmet Coşar",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng396",lessonDayTimes:["Monday"   :["15:20-16:10","16:20-17:10"] ,"Thursday": ["13:20-14:10"]],lessonTeacherName:"GÜl Tokdemir",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng407",lessonDayTimes:["Tuesday"  :["09:20-10:10"],"Friday":["10:20-11:10","12:20-13:10"]],lessonTeacherName:"Ahmet Coşar",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng491",lessonDayTimes:["Tuesday"  :["10:20-11:10","12:20-13:10"] ,"Thursday":["10:20-11:10"]],lessonTeacherName:"Nurdan Saran",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng393",lessonDayTimes:["Monday"   :["11:20-13:10"],"Wednesday":["10:20-11:10","11:20-13:10"]],lessonTeacherName:"Ahmet Coşar",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng408",lessonDayTimes:["Monday"   :["10:20-11:10","11:20-12:10","12:20-13:10"],"Friday":["09:20-10:10"]],lessonTeacherName:"Ahmet Coşar",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng442",lessonDayTimes:["Tuesday"  :["09:20-10:10"],"Thursday":["10:20-11:10","10:20-11:10"]],lessonTeacherName:"Faris Serdar Taşel",registeredStudents: ["11"]),
        LessonDayNameFeatures(lessonName:"Ceng497",lessonDayTimes:["Monday"   :["12:20-13:10","13:20-14:10"] ,"Wednesday":["09:20-10:10","10:20-11:10"]],lessonTeacherName:"Ahmet Coşar",registeredStudents:["11"])
    ]
}
let coursesElectrical : [String] = ["EE101","EE103","EE104","EE154","EE203","EE205","EE209","EE213","EE202","EE204","EE206","EE208","EE212","EE301","EE309","EE315","EE321","EE304","EE326","EE407","EE408"]
