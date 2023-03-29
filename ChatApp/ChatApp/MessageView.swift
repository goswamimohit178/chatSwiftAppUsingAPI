//
//  MessageView.swift
//  ChatApp
//
//  Created by Appripe on 28/03/2023.
//

import SwiftUI
import Apollo

struct MessageView: View {
    
    
 @State private var message = ""
    @State private var messages = [Message]()
    let apolloClient = ApolloClient(url: URL(string: "http://192.168.29.119:4000")!)

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(messages, id: \.self) { message in
                        ChatBubble(currentUserID: messages.first!.sender, message: message)
                        
                        
                    }
                }
            }
            HStack {
                TextField("Type your message here", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(8)
                Button(action: sendMessage) {
                    
                    Image(systemName: "paperplane.fill")
                        .font(.headline)
                   
                    
                    
                }
                .padding(8)
                .foregroundColor(Color.blue)
            }
            
        }
        .onAppear {
                   fetchData()
               }
    }
    
    func fetchData() {
        apolloClient.fetch(query: TestSchemaName.GetAllMessagesQuery(), cachePolicy: .fetchIgnoringCacheData) { result in
            guard let data = try? result.get().data else { return }
            self.messages = data.messages!.map { message in
                Message(sender: message!._id, content: message!.content)
                //                let messages = data.messages!.map { Message(sender: $0!._id, content: $0!.content) }
                //                self.messages = messages
            }
        }
        }
    
    func sendMessage() {
        messages.append(Message(sender: "User2", content: message))
        message = ""
    }
}

struct ChatBubble: View {
    var currentUserID: String
    
    var message: Message
    
    @State private var messages = [Message(sender: "User1", content: "Hello"), Message(sender: "User2", content: "Hi there")]
    
    init(currentUserID: String, message: Message) {
        self.message = message
        self.currentUserID = currentUserID
    }
            
    var body: some View {
       
        HStack {
            if message.sender != currentUserID {
                Spacer()
            }
            
            VStack(alignment: .leading) {
               
                Text(message.content)
               
                .foregroundColor(Color.white)
                    .padding(8)
                    .background(message.sender == "User2" ? Color.blue : Color.gray)
                    .cornerRadius(10)
                Text("12:00 PM")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            if message.sender == currentUserID {
                Spacer()
            }
            
        }
    }
       
}

struct Message: Hashable {
    var id = UUID()
    let sender: String
    var content: String
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
