# X - A Twitter/X Clone

A social media application built with Ruby on Rails 8, featuring real-time updates with Hotwire (Turbo & Stimulus).

## Features

- **User Authentication** - Sign up, sign in, and manage sessions with Devise
- **Posts** - Create, view, and delete posts
- **Reposts** - Repost content from other users
- **Comments** - Reply to posts with real-time updates
- **User Profiles** - View user profiles with profile images (Active Storage)
- **Real-time Updates** - Turbo Streams for instant UI updates without page reloads

## Tech Stack

- **Framework**: Ruby on Rails 8.0
- **Database**: PostgreSQL
- **Frontend**: Hotwire (Turbo + Stimulus), Tailwind CSS
- **Authentication**: Devise
- **Asset Pipeline**: Propshaft, jsbundling-rails
- **File Storage**: Active Storage
- **Background Jobs**: Solid Queue
- **Caching**: Solid Cache
- **WebSockets**: Solid Cable
- **Deployment**: Kamal (Docker-based)

## Requirements

- Ruby 3.2+
- PostgreSQL
- Node.js & Yarn

## Getting Started

### 1. Clone the repository

```bash
git clone <repository-url>
cd X
```

### 2. Install dependencies

```bash
bundle install
yarn install
```

### 3. Setup the database

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed  # Optional: load seed data
```

### 4. Start the development server

```bash
bin/dev
```

This starts the Rails server, CSS watcher, and JS bundler concurrently.

Visit `http://localhost:3000` in your browser.

## Running Tests

```bash
bin/rails test
```

## Project Structure

```
app/
├── controllers/
│   ├── posts_controller.rb      # Posts CRUD
│   ├── comments_controller.rb   # Comments on posts
│   └── profiles_controller.rb   # User profiles
├── models/
│   ├── user.rb                  # User model (Devise)
│   ├── post.rb                  # Post model (supports reposts)
│   └── comment.rb               # Comment model
└── views/
    ├── posts/                   # Post views and partials
    ├── comments/                # Comment partials and Turbo Streams
    └── profiles/                # Profile views
```

## API Routes

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Home feed (all posts) |
| POST | `/posts` | Create a new post |
| GET | `/posts/:id` | View a single post with comments |
| DELETE | `/posts/:id` | Delete a post |
| POST | `/posts/:id/repost` | Repost a post |
| POST | `/posts/:post_id/comments` | Add a comment |
| DELETE | `/posts/:post_id/comments/:id` | Delete a comment |
| GET | `/profiles/:id` | View a user profile |

## Deployment

This app is configured for deployment with [Kamal](https://kamal-deploy.org/). See `config/deploy.yml` for configuration.

```bash
bin/kamal setup
bin/kamal deploy
```

## License

This project is open source and available under the [MIT License](LICENSE).
