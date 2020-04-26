# Trustpilot Business Links generator gem [![Build Status](https://travis-ci.org/trainline-eu/trustpilot-business-links.svg?branch=master)](https://travis-ci.org/trainline-eu/trustpilot-business-links) [![Gem Version](https://badge.fury.io/rb/trustpilot-business-links.svg)](http://badge.fury.io/rb/trustpilot-business-links)

Generate the [Trustpilot Business Generated Links](https://support.trustpilot.com/hc/en-us/articles/115002337108-Trustpilot-s-Business-Generated-Links-) in ruby.

## Requirements
Ruby 2.1.0 or newer.

This gem is tested against [supported versions of Ruby](https://www.ruby-lang.org/en/downloads/branches/) and no support will be provided for EOL Ruby releases.

## Installation
`gem install trustpilot-business-links`

## Usage
~~~ruby
require 'json'
require 'trustpilot-business-links'

# Keys generated on https://businessapp.b2b.trustpilot.com/#/invitations/business-generated-links
encryption_key = 'gn96sJwFRQuQl3bjNIPM0xp+TnK4iBaW0I4DpR0o+cs='
authentication_key = 'eE4zdEfGNlxjGVjtWpOLAYAM0gKeF5j6Db7ZXd1Bixo='
trustpilot_bgl = TrustpilotBusinessLinks.new(encryption_key, authentication_key)

review_payload = {
  email: "customer1@example.net",
  name: "John Smith",
  ref: "1234",
}

encrypted_payload = trustpilot_bgl.encrypt(review_payload.to_json)

puts "https://www.trustpilot.com/evaluate-bgl/www.example.com?p=#{encrypted_payload}"
~~~

## Test
~~~bash
make test
~~~

100% of the source code should be covered by tests.

## Contributing
You are warmly welcome to contribute to the project!

## Documentation
* https://support.trustpilot.com/hc/en-us/articles/115004145087--Business-Generated-Links-for-developers-

## License
The projected is licensed under the MIT license. See [LICENSE.md](LICENSE.md).
