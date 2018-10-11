# sp-ruby-exercise

This test should not take you longer than two hours to complete. 

What we are looking for: functionality, efficiency, readability and tests
Use this test to demonstrate your understanding of OO and TDD.

Write a ruby script that:

1. Receives a log as argument (webserver.log is provided)
  e.g.: `./parser.rb webserver.log`

2. Returns the following:

    a. list of webpages with most page views ordered from most pages views to less page views
    ```
    /home 90 visits
    /index 80 visits
    etc...
    ```

    b. list of webpages with most unique page views also ordered
    ```
    /about/2   8 unique views
    /index     5 unique views
    etc...
    ```
    
## Running tests

```
bundle install
bundle exec rspec spec
```
