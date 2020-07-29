//
//  NewTodoView.swift
//  todo
//
//  Created by jinhyuk on 2020/07/28.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import SwiftUI

struct NewTodoView: View {
    
    /// View의 상태를 저장하는 값, 뷰를 코드로 닫는데 사용한다.
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    /// Combine 프레임워크 사용
    @ObservedObject var viewModel: NewTodoViewModel
    @ObservedObject private var keyboard = KeyboardResponder()
    
    @State var title = ""
    
    private var isAddButtonDisabled: Bool { // 1
        title.isEmpty
    }
    
    private var addButtonColor: Color { // 2
        isAddButtonDisabled ? .gray : .blue
    }
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter Name", text: $title)
            Spacer()
            HStack {
                Button(action: {
                    /// Cancel 버튼 선택시 뷰를 닫는다.
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                
                Button(action: {
                    if !self.isAddButtonDisabled {
                        self.viewModel.addNewTodo(title: self.title)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add")
                        .foregroundColor(.black)
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                    .background(addButtonColor) // 5
                    .disabled(isAddButtonDisabled)
            }
        }
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut(duration: keyboard.duration))
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: NewTodoViewModel())
    }
}
