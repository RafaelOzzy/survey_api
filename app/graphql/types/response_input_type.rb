module Types
  class ResponseInputType < Types::BaseInputObject
    argument :content, String, required: true
  end
end
