//
//  TodoRow.swift
//  todo
//
//  Created by jinhyuk on 2020/07/30.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import SwiftUI

struct TodoRow: View {
    
    var todo: Todo
    
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
            .resizable()
            .frame(width: 20, height: 20)
                .foregroundColor(todo.isCompleted ? .blue : .black)
            Text(todo.title)
            Spacer()
        }
        
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo(title: "밥먹기"))
            .previewLayout(.fixed(width: 300, height: 44))
    }
}
