//
//  TodoListViewModel.swift
//  todo
//
//  Created by jinhyuk on 2020/07/22.
//  Copyright © 2020 jinhyuk. All rights reserved.
//

import Foundation
import Combine

protocol TodoListViewModelProtocol {
    /// View의 전달 목적
    var todos: [Todo] { get }
    var showCompleted: Bool { get set }
    func fetchTodos()
    func toggleIsCompleted(for todo: Todo)
}

/// ObservableObject 채택함으로서 뷰모델을 Observe 가능하도록 만든다.
final class TodoListViewModel: ObservableObject {
    
    /// 뷰에서 Observe 하도록 @Published 설정
    @Published var todos = [Todo]()
    @Published var showCompleted = false
    
    var dataManager: DataManagerProtocol
    
    /// 초기화함수
    /// - Parameter dataManager: default로 설정되어있음. 싱글톤 객체이기에 외부에서 주입해도 같음.
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchTodos()
    }
}

extension TodoListViewModel: TodoListViewModelProtocol {
    
    /// Todo 리스트 가져오기
    func fetchTodos() {
        todos = self.dataManager.fetchTodoList(includingCompleted: showCompleted)
    }
    
    /// Todo의 완료 여부 설정
    /// - Parameter todo: Todo 
    func toggleIsCompleted(for todo: Todo) {
        self.dataManager.toggleIsCompleted(for: todo)
    }
    
    
}
