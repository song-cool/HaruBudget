//
//  AddNewItem.swift
//  HaruBudgetWatch WatchKit Extension
//
//  Created by 송시원 on 2022/08/30.
//

import SwiftUI

struct AddNewItem: View {
    
    @State private var contents = ""
    @State private var tagName = ""
    @State private var dateAdded = Date()
    @State private var amount: Int = 0
    @State private var isIncome = false

    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Form{
                TextField("테그", text: $tagName)
                TextField("항목을 입력해주세요", text: $contents)
                TextField("지출 금액", value: $amount, formatter: NumberFormatter())
            }
            Spacer()
            Button(action: addItem) {
                Text("입력완료")
            }
            
        }
        .padding()
    }
    
    private func addItem() {
        //폴더라는 데이터형식으로  만들어서
        let item = Item(context: context)
        item.contents = contents
        item.dateAdded = Date()
        item.tagName = tagName
        item.amount = Int32(amount)
        item.isIncome = isIncome

        
        
        // 폰으로 전송
//        ConnectionModelWatch.shared.session.sendMessage(["contents": contents, "tagName": tagName, "dateAdded": dateAdded, "amount": amount], replyHandler: nil))

        
        do {
            // 저장
            try context.save()
            // 화면 내리기
            presentationMode.wrappedValue.dismiss()
        } catch let err {
            // do 부분을 실패할 경우 실행되는 함수. 오류를 리턴함.
            print(err.localizedDescription)
        }
    }
}

struct AddNewItem_Previews: PreviewProvider {
    static var previews: some View {
        AddNewItem()
    }
}
