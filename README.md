# Wootric

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/wootric`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wootric-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wootric-ruby

## Usage Examples

### Authentication

Authenticate the client and start exporting data from your account.

```ruby
require "wootric"

client = Wootric::Client.new(<wootric_email>, <wootric_password>)

client.auth_token
#=> "<Wootric Access Token>"
```

Here are some common use cases for the Wootric v1 API client.

### You can list all end users for a specific account, and get the details about each end user.

```ruby
client.end_users

#=>
[
  {
    "id": 1,
    "created_at" : "2014-12-01 18:36:59",
    "updated_at" : "2014-12-01 18:36:59",
    "email": "nps@example.com",
    "last_surveyed": null,
    "external_created_at": null,
    "user_id": 16,
    "page_views_count" : 1,
    "properties": {"plan": "Small Business", "product": "Example"}
  },
  {
    "id": 2,
    "created_at" : "2014-12-01 18:36:59",
    "updated_at" : "2014-12-04 12:43:44",
    "email": "nps2@example.com",
    "last_surveyed": null,
    "external_created_at": null,
    "user_id": 16,
    "page_views_count" : 3,
    "properties": {"plan": "Enterprise", "product": "The Company"}
  }
]
```

### You can find specific end user by their user_id.

```ruby
client.find_end_user("16313044")

#=>
{
  "id": 2,
  "created_at" : "2014-12-01 18:36:59",
  "updated_at" : "2014-12-04 12:43:44",
  "email": "nps2@example.com",
  "last_surveyed": null,
  "external_created_at": null,
  "user_id": 16,
  "page_views_count" : 3,
  "properties": {"plan": "Enterprise", "product": "The Company"}
}
```

### You can list all responses.

```ruby
client.responses(page: 5, per_page: 10, sort_order: dsc)

#=>
[
  {
    "id": 1,
    "created_at" : "2014-12-01 18:36:59",
    "updated_at" : "2014-12-01 18:36:59",
    "score": 10,
    "text": "Great Service",
    "ip_address": "192.168.0.1",
    "origin_url" : "http://www.great-service.com",
    "end_user_id": 1,
    "user_id": 16
  },
  {
    "id": 2,
    "created_at" : "2014-11-01 17:38:50",
    "updated_at" : "2014-11-01 17:38:50",
    "score": 0,
    "text": "Please fix those bugs",
    "ip_address": "127.0.0.1",
    "origin_url" : "http://www.fix-bugs.com",
    "end_user_id": 2,
    "user_id": 16
  }
]
```

### You can list all declines.

```ruby
client.declines(page: 5, per_page: 10)

#=>

[
  {
    "id": 1,
    "end_user_id": 1,
    "created_at":  "2014-11-01 17:38:50",
    "updated_at":  "2014-11-01 17:38:50",
    "user_id": 1,
    "survey_id": 1
  },
  {
    "id": 2,
    "end_user_id": 2,
    "created_at":  "2014-11-01 17:38:50",
    "updated_at":  "2014-11-01 17:38:50",
    "user_id": 1,
    "survey_id": 2
  }
]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wootric. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

