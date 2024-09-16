# Project Conversation

Project Conversation is a web application that allows users to manage projects, add comments, and track project status changes. It provides a collaborative platform for team members to communicate and stay updated on project progress.

## Assumptions made:

- There are only 3 statuses for a project: 'Not Started', 'In Progress', and 'Completed'.
- Author of the comment is displayed as the email address of the user who created the comment.
- Many comments can be added to a single project, so the conversation history is paginated to 10 comments at a time.

## Future improvements

- Allow users to add custom statuses to a project
- Allow users to only show comments, or only show status updates
- Make use of stimulus and turbo to update the page in real time

## Features

- User authentication (sign up, sign in, sign out)
- Create and view projects
- Add comments to projects
- Update project status
- Paginated conversation history for each project

## Technologies Used

- Ruby on Rails
- RSpec for testing
- Capybara for feature tests
- Tailwind CSS for styling
- PostgreSQL database

## Setup and Installation

1. Clone the repository:
   ```
   git clone https://github.com/your-username/project-conversation.git
   cd project-conversation
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:create db:migrate
   ```

4. Start the Rails server:
   ```
   bin/dev
   ```

5. Visit `http://localhost:3000` in your web browser to access the application.

## Running Tests

To run the test suite, use the following command:

```
bundle exec rspec
```


