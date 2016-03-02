# Banking Data

[![Build Status](https://travis-ci.org/opahk/banking_data.png?branch=master)](https://travis-ci.org/opahk/banking_data)
[![Coverage Status](https://coveralls.io/repos/opahk/banking_data/badge.png?branch=master)](https://coveralls.io/r/opahk/banking_data?branch=master)
[![Code Climate](https://codeclimate.com/github/opahk/banking_data.png)](https://codeclimate.com/github/opahk/banking_data)

Banking data (including SWIFT-codes/BIC) for Germany, Austria, Switzerland.

## CHANGELOG

### 0.6.0

* Update SWIFT data of austrian and german banks

### 0.5.1
* fix compatibility with `smarter_csv` >= 1.1.0
`smarter_csv` now turns `-` into `_` in headers, which broke the
matching on Austrian bank data.

## Installation

Add this line to your application's Gemfile:

    gem 'banking_data'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install banking_data

## Usage


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
