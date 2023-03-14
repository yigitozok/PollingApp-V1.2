//
//  DaysDetailView.swift
//  PollinApp1.2
//
//  Created by Yiğit Özok on 20.02.2023.
//

import SwiftUI

//Animation created;
struct CornerRotateModifie: ViewModifier{
    let amount : Double
    let anchor : UnitPoint
     
    func body(content : Content )-> some View{
        content
            .rotationEffect(.degrees(amount),anchor: anchor)
            .clipped()
    }
}
extension AnyTransition{
    static var pivot : AnyTransition{
        .modifier(
            active: CornerRotateModifie(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifie(amount: 0, anchor: .topLeading)
        )
    }
}
struct DaysDetailView : View {
  
    @State private var enabled = false
    
    @State var receiveTeacherName    :  String // The data we receive from "DaysView"(Class-> Lessons)
    @State var reveiceLessonDayTimes :  String // The data we receive from "DaysView"(Class -> Lessons)
    
    
    @State var receiveLessonName     :  String // The selected we receive from "AdminCourses || StudentCourses" view.
    @State var receiveWeek           :  String // The selected we receive from "WeekView".
    @State var receiveDepartmant     :  String // The selected we receive from "AdminLogin".
    
    var body: some View{
        NavigationStack{
                HStack{
                    VStack(alignment: .leading,spacing: 5){
                        HStack{
                            Text(receiveLessonName)
                                .font(.system(size: 17,weight: .medium,design: .monospaced))
                            Spacer()
                            Text(receiveTeacherName)
                                .font(.system(size: 13,design: .rounded))
                        }
                        Rectangle()
                            .frame(width: 75,height: 1)
                            .foregroundColor(Color.black.opacity(0.3))
                        HStack{
                            Text(reveiceLessonDayTimes)
                                .font(.system(size: 15))
                            Spacer()
                            Button(action: {
                                withAnimation{
                                    enabled.toggle()
                                }
                            }, label:{
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.purple.opacity(0.75))
                                    .font(.system(size: 20))
                            })
                            Spacer().frame(width: 25)
                            
                            
                        }
                        Text("Course Content : Introduction")
                            .font(.system(size: 13,weight: .light))
                        Spacer()
                    }
                    .padding()
                    Spacer()
                }
                
                .background(enabled ? Color("blue1").opacity(0.85): .secondary.opacity(0.3))
                .frame(width: 350,height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .animation(.default,value: enabled)
               
               
                
            }
        }
}
struct DaysDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DaysDetailView(receiveTeacherName: "", reveiceLessonDayTimes: "", receiveLessonName: "",receiveWeek: "",receiveDepartmant: "")
    }
}
