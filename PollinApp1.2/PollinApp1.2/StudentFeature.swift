//
//  StudentFeature.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 15.02.2023.
//

import Foundation
struct StudentFeatures : Codable , Hashable  {
    var id = UUID()
    var studentNo  :  String?
    var password   :  String?
    var departman  :  String?
    var selectedLessons : [String]?
}
