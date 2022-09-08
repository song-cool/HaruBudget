//
//  ListView.swift
//  HaruBudgetWatch WatchKit Extension
//
//  Created by 송시원 on 2022/08/30.
//

import SwiftUI

struct ListView: View {
    
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Item.dateAdded, ascending: false)], animation: .easeInOut)
    var results: FetchedResults<Item>
    
    var body: some View {
        NavigationView {
            
            VStack{
                
                
                Form {
                    HStack{
                        NavigationLink(destination: AddNewItem()) {
                            Text("\(Image(systemName: "plus.circle")) Add")
                        }
                        .padding()
                    }
                    Section(header: Text("\(getDay(date: Date()))")) {
                        ForEach(results) { item in
                            ListSubView(contents: item.contents ?? "", tag: item.tagName ?? "", amount: Int(item.amount))
                        }
                        ListSubView(contents: "벳져가 가져감", tag: "식비", amount: 10000)
                        ListSubView(contents: "학식", tag: "식비", amount: 1000)
                        
                    }
                    Section(header: Text("User Profiles")) {
                        ListSubView(contents: "학식", tag: "식비", amount: 3000)
                        
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func getDay(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd(EEEEEE)"
        let convertStr = dateFormatter.string(from: date)
        return convertStr
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


struct ListSubView: View {
    let contents: String
    let tag: String
    let amount: Int
    
    var body: some View {
        HStack{
            Text("\(Image(systemName: "minus.circle"))")
            Text(tag)
            Text(contents)
                .foregroundColor(.gray)
            Spacer()
            Text(String(amount))
                .fontWeight(.semibold)
        }
    }
}
