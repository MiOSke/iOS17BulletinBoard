//
//  MessageController.swift
//  iOS17BulletinBoard
//
//  Created by Michael Kampouris on 2/5/18.
//  Copyright © 2018 broCode. All rights reserved.
//

import Foundation

class MessageController {
    static let shared = MessageController()
    let ckManager = CloudKitManager()
    
    var messages: [Message] = [] {
        didSet {
            loadMessages()
        }
    }

    
    private init() {
        loadMessages()
    }
    
    //save a new message
    
    func saveNewMessageWith(text: String){
        let newMessage = Message(text: text)
        ckManager.save(message: newMessage)
    }
    
    //load all messages
    
    func loadMessages() {
        ckManager.load { (records, error) in
            if let error = error {
                print("Error querying records from CloudKit \(error.localizedDescription)")
                return
            }
            guard let records = records else { return }
            
            for record in records {
                guard let message = Message(record: record) else { continue }
                self.messages.append(message)
                print("Loaded a message")
            }
        }
    }
    
}
