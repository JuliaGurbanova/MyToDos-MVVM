//
//  AddTaskViewController.swift
//  MyToDos-MVVM
//
//  Created by Julia Gurbanova on 11.04.2024.
//

import UIKit

class AddTaskViewController: UIViewController {
    private var addTaskView: AddTaskView!
    private var tasksListModel: TasksListModel!

    init(tasksListModel: TasksListModel) {
        super.init(nibName: nil, bundle: nil)
        self.tasksListModel = tasksListModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        setupAddTaskView()
    }

    private func setupAddTaskView() {
        let viewModel = AddTaskViewModel(tasksListModel: tasksListModel, taskService: TaskService())
        addTaskView = AddTaskView(viewModel: viewModel)
        addTaskView.delegate = self
        self.view = addTaskView
    }
}

extension AddTaskViewController: AddTaskViewControllerDelegate {
    func addTask() {
        dismiss(animated: true)
    }
}
