# Aura - Emotional Wellbeing Tracker

Aura is a web application designed to help users track their emotional wellbeing through daily mood and activity logging.

## Features

- 🎯 Mood tracking with emojis
- ⚡ Energy level monitoring
- 📝 Daily activity logging
- 📊 Historical mood visualization
- 📱 Responsive design with Tailwind CSS
- 🔐 Secure authentication with Devise

## Requirements

- Ruby 3.2.2
- Rails 7.1.3
- PostgreSQL 14+
- Node.js 18+

## Installation

1. Clone the repository

```
git clone https://github.com/your-username/aura
cd aura
```

2. Install dependencies

```
bundle install
yarn install
```

3. Configure the database

```
rails db:create
rails db:migrate
```

4. Start the server

```
bin/dev
```

## Tests

The project uses RSpec for testing. To run the test suite:

```
bundle exec rspec
```

To run the linter:

```
bundle exec rubocop
```

## Project Structure

- `app/models/` - Application models
- `app/controllers/` - Controllers
- `app/views/` - Views and components
- `app/javascript/` - JavaScript and Stimulus controllers
- `spec/` - Test suite

## Contributing

1. Fork the project
2. Create your feature branch (git checkout -b feature/amazing-feature)
3. Commit your changes (git commit -m 'Add some amazing feature')
4. Push to the branch (git push origin feature/amazing-feature)
5. Open a Pull Request

## License

This project is under the MIT License - see the file [LICENSE.md](LICENSE.md) for more details.

## Contact

Walter Mendez - [@soywaltermendez](https://twitter.com/soywaltermendez)

Project link: [https://github.com/tu-usuario/aura](https://github.com/tu-usuario/aura)
