//
//  AddNewItem.swift
//  HaruBudgetWatch
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
                TextField("항목을 입력해주세요", text: $contents)
                TextField("테그", text: $tagName)
                DatePicker("사용일", selection: $dateAdded)
                    .datePickerStyle(WheelDatePickerStyle()).labelsHidden()
                TextField("지출 금액", value: $amount, formatter: NumberFormatter())
            }
            Spacer()
            Button(action: addItem) {
                Text("입력완료")
                    .padding(.vertical, 10)
            }
        }
        .padding()
    }
    
    private func addItem() {
        //폴더라는 데이터형식으로  만들어서
        let item = Item(context: context)
        item.contents = contents
        item.dateAdded = dateAdded
        item.tagName = tagName
        item.amount = Int32(amount)
        item.isIncome = isIncome
        
        // 이부분에서 folder를 저장해버림.
        do {
            try context.save()
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
