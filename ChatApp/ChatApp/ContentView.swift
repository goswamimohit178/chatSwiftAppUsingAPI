//
//  ContentView.swift
//  ChatApp
//
//  Created by Appripe on 27/03/2023.
//

import SwiftUI
import Apollo

struct ContentView: View {
    
     @State private var messageText: String = ""
     @State private var messages: [String] = []
     @State var groups : [GroupId] = []
     @State var selectedGroupID: String? = nil
    
    let apolloClient = ApolloClient(url: URL(string: "http://192.168.29.119:4000")!)
    
    func fetchData() {
        apolloClient.fetch(query: TestSchemaName.GetallGroupsQuery(), cachePolicy: .fetchIgnoringCacheData) { result in
            let data = try? result.get().data?.groups?.compactMap { $0 }
            guard let data = data else { return }
            groups = data.compactMap { GroupId(groupID: $0._id , groupName: $0.groupName! )}
        }
    }
    
    func sendGroupID() {
        guard let selectedGroupID = selectedGroupID else { return }
        print("Selected group ID: \(selectedGroupID)")
   
        }
    
    
    var body: some View {
        VStack() {
            Text("Group Names")
                .font(.title)
                .fontWeight(.bold)
                VStack(alignment: .leading) {
                    NavigationView {
                        List() {
                            ForEach(groups) { group in
                                NavigationLink(destination: MessageView()) {
                                    Text(group.groupName)
                                    
                                }.padding()
                                    .onTapGesture {
                                       
                                      selectedGroupID = group.groupID
                                          sendGroupID()
                                        
                                        }
                            }
                        }
                    }
                    }
        }.onAppear() {
            fetchData()
        }
            
//            HStack {
//                TextField("Type your message here", text: $messageText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .autocorrectionDisabled()
//                Button(action: {
//                    messages.append(messageText)
//                    messageText = ""
//                }) {
//                    Text("Send")
//                }
//            }
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GroupId: Identifiable {
   var  id = UUID()
    var  groupID : String
    var groupName: String
}
