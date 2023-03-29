// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension TestSchemaName {
  class GetAllMessagesQuery: GraphQLQuery {
    public static let operationName: String = "getAllMessages"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query getAllMessages {
          messages {
            __typename
            _id
            content
          }
        }
        """#
      ))

    public init() {}

    public struct Data: TestSchemaName.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { TestSchemaName.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("messages", [Message?]?.self),
      ] }

      public var messages: [Message?]? { __data["messages"] }

      /// Message
      ///
      /// Parent Type: `Message`
      public struct Message: TestSchemaName.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { TestSchemaName.Objects.Message }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("_id", TestSchemaName.ID.self),
          .field("content", String.self),
        ] }

        public var _id: TestSchemaName.ID { __data["_id"] }
        public var content: String { __data["content"] }
      }
    }
  }

}