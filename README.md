# Wiziq

A library to access [wiziq](http://developer.wiziq.com/) REST api.(only classes for now)

## Installation

Add this line to your application's Gemfile:

    gem 'wiziq'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wiziq

## Usage Examples

###Configuration
You need to get `access_key` and `secret_key` from [wiziq](http://wiziq.com).[Register](http://www.wiziq.com/api/) to get your api keys.

```ruby
client = Wiziq::REST::Client.new do |config|
  config.access_key   = "YOUR_ACCESS_KEY"
  config.secret_key   = "YOUR_SECRET_KEY"   
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request