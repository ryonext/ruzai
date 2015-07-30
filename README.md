# Ruzai

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/user_ban`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruzai'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install user_ban

## Usage

### Migrate your model which manages user's suspention

`bundle exec rake ruzai:install {your model name}`
(Default value is 'User')

and run `bundle exec rake db:migrate`

so, you can get "suspended_count" and "suspention_expired_at" for the model.

### Include Ruzai for your model.

If your model name is "User", write below.

```
class User < ActiveRecord::Base
  include Ruzai
  # your codes...
end
```

### Suspend user's account.

* `Ruzai#suspend!`

You can suspend user's account for a while. (Default value is 2 weeks, and you can configure it.)
In addition, when user gets suspended a certain number of times, user's suspention is not released.(Default value is 5)

* `Ruzai#suspended?`

You can check a user is suspended or not.

* `Ruzai#suspended_until`

You can get a remain duration until user's suspention is released.

* `Ruzai#ban!`

You can ban a terrible user eternally.

### Configuring

You can set suspention duration and suspention limit.

`suspention_duration` is duration of suspention.
`respawn_limit` is max number which user can released from their suspention.

Please create config/initializes/ruzai.rb and write like this.

```
Ruzai.configure do |config|
  config.suspention_duration = 5.days
  config.respawn_limit = 3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/user_ban. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

