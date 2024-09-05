# Stock Portfolio 

This project creates a class `Portfolio` with `Stock` objects.

`Stock` class has a `price` method that returns the stock's price on a given date.

The `Portfolio` class has a method called `profit` which receives a date range and calculates the profit between those dates. Optionally returns the annualized return if you provide `annualized_return: true`.

The stock data is extracted from [Yahoo! Finance](https://finance.yahoo.com/).

Additionally I've created some modules to load the data to memory, create settings, run tests and split the files by class. I hope this doesn't mess up the code reliability.

## Usage
```
gem install bundler
bundle install
ruby main.rb
```

## Tests
```
bundle exec rspec
```

<hr>

This code was made with ❤️ and a few LLM's