# Survey API

Survey API is a Ruby on Rails application that provides an interface for creating and managing surveys with multiple questions. This API is designed to provide a simple and efficient way to create and respond to surveys.

## Features

- Create surveys with multiple questions.
- Reorder questions within a survey.
- Submit responses to specific survey questions.
- Manage users with different roles (coordinator and respondent).

## UML Diagram

![Link to the UML Diagram](https://lucid.app/publicSegments/view/dfc42cef-1205-4ee9-b9ac-f44954783e89/image.png)

## Technologies Used

- Ruby on Rails
- PostgreSQL
- GraphQL
- RSpec (for testing)

## Installation

1. Clone the repository:
 ```
   bash
   git clone https://github.com/your-username/survey_api.git
   cd survey_api
 ```
2. Install dependencies:
```
bundle install
```
3. Set up the database:
```
rails db:create
rails db:migrate
```
4. Run the tests to ensure everything is working:
```
bundle exec rspec
```

## Usage

### User Authentication
The API uses Devise for user authentication. A user can have one of the following roles:

- Coordinator: Can create, edit, and delete surveys.
- Respondent: Can answer survey questions.

### Main Endpoints
- Create Survey
  - Endpoint: /graphql
  - Method: POST
  - Query Example:
```
mutation {
  createSurvey(input: { title: "New Survey", questions: [{content: "Question 1"}, {content: "Question 2"}] }) {
    survey {
      id
      title
      questions {
        id
        content
      }
    }
  }
}
```
- Reorder Questions
  - Endpoint: /graphql
  - Method: POST
  - Query Example:
```
mutation {
  reorderQuestions(input: { surveyId: 1, questionIds: [2, 1] }) {
    survey {
      id
      questions {
        id
        content
      }
    }
  }
}
```
- Submit Response
  - Endpoint: /graphql
  - Method: POST
  - Query Example:
```
mutation {
  submitResponse(input: { questionId: 1, content: "My Answer" }) {
    response {
      id
      content
    }
  }
}
```
# Thank you!

