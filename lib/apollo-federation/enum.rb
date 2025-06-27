# frozen_string_literal: true

require 'apollo-federation/has_directives'

module ApolloFederation
  module Enum
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      include HasDirectives

      def tag(name:)
        add_directive(name: 'tag', arguments: [name: 'name', values: name])
      end

      def inaccessible
        add_directive(name: 'inaccessible')
      end

      def requires_scopes(scopes)
        add_directive(
          name: 'requiresScopes',
          arguments: [
            name: 'scopes',
            values: scopes,
          ],
        )
      end
    end
  end
end
