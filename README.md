# Whathor

Whathor allows you in an easy way to send Whatsapp messages directly from your ruby app by acting
as a wrapper for Whatools Rest API. To be able to use this gem you have to register and
get a token key from [https://wha.tools](https://wha.tools/).

## Installation

Add this line to your application's Gemfile:

    gem 'whathor'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whathor

## Usage

There are only three easy steps for this to work:

```ruby

  # 1. Before any message is sent for the first time, you have to subscribe against Whatools Rest API
  # by passing the token.
  Whathor.subscribe "MY_WHATOOLS_TOKEN"

  # 2. Sends a message to another whatsapp user by specifying the phone number prefixed with country code
  # and body of the message.
  Whathor.message to: '573001231231231', body: "This is cool! :)" # 57 = country code, 3001231231231 = Phone number

  # 3. When you are done sending messages. Unsubscribe from Whatools so that further notifications and
  # messages are not lost.
  Whathor.unsubscribe
```
You can read more about Whatools API specification in [https://api.wha.tools/v0](https://api.wha.tools/v0/)
