require 'json'
require 'graphql'
require 'graphql/schema_comparator'

class SimpleDiff
  include GraphQL::SchemaComparator::Changes

  def initialize(schema_old, schema_new)
    schema_old = load_schema(schema_old)
    schema_new = load_schema(schema_new)
    changes = GraphQL::SchemaComparator.compare(schema_old, schema_new).changes

    changes.each do |change|
      case change
      when FieldAdded
        type = change.object_type.graphql_name
        input = change.field.arguments.keys
        update_diff(type, { name: change.field.graphql_name, message: change.message, args: input})
      when FieldArgumentAdded
        type = change.field.graphql_name
        update_diff(type, {name: change.field.graphql_name, message: change.message})
      when InputFieldAdded
        type = change.input_object_type.graphql_name
        update_diff(type, { name: change.field.graphql_name, message: change.message })
      when TypeAdded
        type = change.type.graphql_name
        if change.type.respond_to?(:fields)
          args = change.type.fields.keys
        elsif change.type.respond_to?(:arguments)
          args = change.type.arguments.keys
        end
        update_diff(type, { name: nil, message: change.message, fields: args || {}, new: true })
      end
    end
  end

  def update_diff(type, desc)
    @diff ||= {}
    @diff[type] ||= [] if type
    @diff[type] << desc
  end

  def print_diff(diff = @diff)
    diff.each do |name, change_info|
      if name == "Mutation"
        puts "****************************\n"
        change_info.each do |mutation|
          puts "⭐ New Mutation! - #{mutation[:name]}"
          puts "  #{mutation[:message]}"
          puts "  Args: #{mutation[:args]}\n\n"
        end
        puts "****************************\n"
      else
        puts "✨ Changes to #{name}"
        change_info.each do |field_change|
          args = field_change[:fields] || []
          puts "  - #{field_change[:message]}"
          puts "\t Fields: #{field_change[:fields]}" if args.any?
        end
        puts "\n"
      end
    end
  end

  def load_schema(file)
    json = JSON.load(File.new(file))
    schema = GraphQL::Schema::Loader.load(json)
  end
end

# Example script for diffing two versions of a GraphQL Schema
# Tested with Ruby 2.7.1, GraphQL Ruby 1.11.4 and GraphQL SchemaComparator 1.0.0
if __FILE__ == $PROGRAM_NAME
  unless ARGV.length == 2
    abort("Missing input schemas! Expecting arguments: <schema_old_path> <schema_new_path>")
  end

  diff = SimpleDiff.new(ARGV[0], ARGV[1])
  diff.print_diff
end
