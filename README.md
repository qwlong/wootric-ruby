# Wootric

A Ruby toolkit for [Wootric](https://www.wootric.com/) API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wootric-ruby'
```
And then execute:

		$ bundle

Or install it yourself as:

    $ gem install wootric-ruby

## Usage

Calls for Wootric API v1 are relative to the base url ``https://api.wootric.com/v1/``

API actions are available as methods on the client object. Currently, the Wootric client has the following methods:

| Action 																	 | Method             					                           |
|:-----------------------------------------|:--------------------------------------------------------|
| **End User**                             |                   					                             |
| Return a collection of all users        | `#end_users`           																 |
| Return a specific user         	       | `#find_end_user(user_id)`                               |
| Create an end user 			    	           | `#create_end_user(email, options={})`                   |
| Update an end user                       | `#edit_end_user(user_id, options={})`                   |
|	Delete a specific end user 							 | `#delete_end_user(user_id)`										         |
| **End User Settings**                    |                   					                             |
| Return a specific end user's settings    | `#end_user_settings(end_user_id)`                       |
| Update and return updated settings       | `#update_user_settings(end_user_id, nps_email)`         |
| **Decline**                              |                   					                             |
| Return declines for a user               | `#declines(options={})`                                 |
| Return all declines for an end user      | `#end_user_declines(end_user_id, options={})`			     |
| Return a specific decline                | `#find_decline(end_user_id, decline_id)`                |
| Delete a decline for an end user         | `#delete_decline(end_user_id, decline_id)` 						 |
| Create a new decline for an end user 		 | `#create_decline(end_user_id, options={})`              |
| **Response															 |                      																	 |
| Return responses for a user              | `#responses(options={})`                					       |
| Return responses for an end user         | `#end_user_responses(end_user_id, options={})`          |
| Return Promoter responses for end user   | `#end_user_promoters_responses(end_user_id, options={})`|
| Return Passive responses for end user    | `#end_user_passives_responses(end_user_id, options={})` |
| Return Detractor responses for end user  | `#end_user_detractors_responses(end_user_id, options={})`|
| Return a specific response 							 | `#find_response(end_user_id, response_id)`              |
| Delete a response for an end user        | `#delete_response(end_user_id, response_id)`            |
| Create a new response for an end user    | `#delete_response(end_user_id, response_id)`            |

## TODO: Usage Examples

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wootric. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).