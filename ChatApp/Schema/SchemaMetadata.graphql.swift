// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol TestSchemaName_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == TestSchemaName.SchemaMetadata {}

public protocol TestSchemaName_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == TestSchemaName.SchemaMetadata {}

public protocol TestSchemaName_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == TestSchemaName.SchemaMetadata {}

public protocol TestSchemaName_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == TestSchemaName.SchemaMetadata {}

public extension TestSchemaName {
  typealias ID = String

  typealias SelectionSet = TestSchemaName_SelectionSet

  typealias InlineFragment = TestSchemaName_InlineFragment

  typealias MutableSelectionSet = TestSchemaName_MutableSelectionSet

  typealias MutableInlineFragment = TestSchemaName_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return TestSchemaName.Objects.Query
      case "Group": return TestSchemaName.Objects.Group
      case "Message": return TestSchemaName.Objects.Message
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}