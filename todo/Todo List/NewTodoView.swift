//
//  NewTodoView.swift
//  todo
//
//  Created by jinhyuk on 2020/07/28.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import SwiftUI

struct NewTodoView: View {
    
    // View의 상태를 저장하는 값, 뷰를 코드로 닫는데 사용한다.
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel: NewTodoViewModel
    
    @State var title = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter Name", text: $title)
            Spacer()
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss() // 2
                }) {
                    Text("Cancel")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)

                Button(action: {
                    if !self.title.isEmpty { // 3
                        self.viewModel.addNewTodo(title: self.title)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Text("Add")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .padding()
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: NewTodoViewModel())
    }
}
