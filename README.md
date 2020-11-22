# Nfl::Roster

Welcome to the NFL-ROSTER LIBRARY!

In this application, you will be able to navigate through the National Football Leagues complete roster list. Using the data from 'https://www.nfl.com/teams/' a scraper will retrieve all team names and their associated roster-url ('https://www.nfl.com/teams/[team_name]/roster). A secondary scraper then uses the team url to access the team's roster website which holds data about individual players.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nfl-roster'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nfl-roster

## Usage

To begin the CLI program, run `ruby bin/run`.

To get a list of helpful commands, you may enter `help`.
To exit at anytime, enter `exit`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nfl-roster. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nfl-roster/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Nfl::Roster project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nfl-roster/blob/master/CODE_OF_CONDUCT.md).
