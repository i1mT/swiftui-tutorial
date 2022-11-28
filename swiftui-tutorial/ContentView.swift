//
//  ContentView.swift
//  todo
//
//  Created by 陶逢华 on 2022/11/27.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var isOn = true
    let name: String
}

class TodoViewModel: ObservableObject{
    @Published private(set) var todoList: [TodoItem]
    
    init() {
        self.todoList = [
            TodoItem(name: "Reading Book")
        ]
    }
    
    func append(_ newItem: TodoItem) {
        todoList.append(newItem)
    }
    
    func toggle(_ item: TodoItem) {
        if let index = todoList.firstIndex(where: {$0.id == item.id}){
            todoList[index].isOn.toggle()
        }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newName: String = ""
    
    var body: some View {
        VStack{
            HStack {
                TextField("Input new task", text: $newName)
                Button("Confirm") {
                    let newItem = TodoItem(name: newName)
                    viewModel.append(newItem)
                    newName = ""
                }
            }
            .padding()
            List {
                ForEach(viewModel.todoList) { item in
                    HStack {
                        Text(item.name).foregroundColor(item.isOn ? .primary : .gray)
                        Spacer()
                        Group {
                            if item.isOn {
                                Image(systemName: "circle")
                            }
                            else {
                                Image(systemName: "checkmark.circle.fill")
                            }
                        }
                        .foregroundColor(.blue)
                        .onTapGesture {
                            viewModel.toggle(item)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
