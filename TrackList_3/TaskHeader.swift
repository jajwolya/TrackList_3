//
//  TaskHeader.swift
//  TrackList_3
//
//  Created by trioxis on 14/5/17.
//  Copyright © 2017 Jajwol. All rights reserved.
//

import UIKit

class TaskHeader: BaseCell {
    
    var homeController: HomeController?

    let nameTextField: UITextField  = {
        let textField = UITextField()
        textField.placeholder = "Task name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let addTaskButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    override func setupViews() {
        addSubview(nameTextField)
        addSubview(addTaskButton)
        
        addTaskButton.addTarget(self, action: #selector(TaskHeader.addTask), for: .touchUpInside)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-[v1(50)]-16-|", views: nameTextField, addTaskButton)
        addConstraintsWithFormat(format: "V:|-16-[v0]-|", views: nameTextField)
        addConstraintsWithFormat(format: "V:|-16-[v0(20)]-|", views: addTaskButton)
    }
    
    func addTask() {
        homeController?.addNewTask(taskName: nameTextField.text!)
        nameTextField.text = ""
    }
    
}
