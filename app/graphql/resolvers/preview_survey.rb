module Resolvers
  class PreviewSurvey < GraphQL::Schema::Resolver
    type Types::SurveyType, null: false
    argument :id, ID, required: true

    def resolve(id:)
      Survey.find(id)
    end
  end
end
