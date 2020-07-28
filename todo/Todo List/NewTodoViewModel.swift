//
//  NewTodoViewModel.swift
//  todo
//
//  Created by jinhyuk on 2020/07/28.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import Combine

// Todo Protocol
protocol NewTodoViewModelProtocol {
    func addNewTodo(title: String)
}

final class NewTodoViewModel: ObservableObject {
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
    
}

extension NewTodoViewModel: NewTodoViewModelProtocol {
    
    func addNewTodo(title: String) {
        
        // 메서드 내부에서 인스턴스를 생상허는 것은 클린하지 않음
//        let todo = Todo(id: UUID(), title: title, isCompleted: false)
//        dataManager.add(todo: todo)
        
        // 항상 어떠한 작업(Task)는 분리되어있어야한다.
        dataManager.addTodo(title: title) 
    }
}
