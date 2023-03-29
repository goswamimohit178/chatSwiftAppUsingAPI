// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension TestSchemaName {
  class GetallGroupsQuery: GraphQLQuery {
    public static let operationName: String = "getallGroups"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query getallGroups {
          groups {
            __typename
            _id
            groupName
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
        .field("groups", [Group?]?.self),
      ] }

      public var groups: [Group?]? { __data["groups"] }

      /// Group
      ///
      /// Parent Type: `Group`
      public struct Group: TestSchemaName.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { TestSchemaName.Objects.Group }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("_id", TestSchemaName.ID.self),
          .field("groupName", String?.self),
        ] }

        public var _id: TestSchemaName.ID { __data["_id"] }
        public var groupName: String? { __data["groupName"] }
      }
    }
  }

}