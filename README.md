# Banking Data

[![Build Status](https://travis-ci.org/opahk/banking_data.png?branch=master)](https://travis-ci.org/opahk/banking_data)
[![Coverage Status](https://coveralls.io/repos/opahk/banking_data/badge.png?branch=master)](https://coveralls.io/r/opahk/banking_data?branch=master)
[![Code Climate](https://codeclimate.com/github/opahk/banking_data.png)](https://codeclimate.com/github/opahk/banking_data)

Banking data (including SWIFT-codes/BIC) for Germany, Austria, Switzerland, Netherlands.

## CHANGELOG

### 0.9.5

* update smarter_csv gem to allow ruby3
* update banking data
* fix dutch name bank name and identifiers

### 0.9.4

* update banking data

### 0.9.3

* update DACH banking data

### 0.9.2

* add new bank data

### 0.9.1

* bugfix: return empty array, when bank not known

### 0.9.0

* add SWIFT data of dutch banks

### 0.8.0

* Update data of swiss banks (bcbankenstamm.txt)

### 0.7.2

* Update SWIFT data of austrian, german and swiss banks

### 0.7.1

* Update SWIFT data of austrian, german and swiss banks

### 0.7.0

* Update SWIFT data of german banks

### 0.6.0

* Update SWIFT data of austrian, german and swiss banks

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
