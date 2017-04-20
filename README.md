## Deployment

It's deployed [here](https://fierce-castle-79402.herokuapp.com/categories). You have access to the front-facing site as well as the admin portion via the admin link on the navbar. Advance search will bring you back to the home page as I didn't finish that feature. Will do so when I have more time tomorrow! :)

## Functionality

* CRUD action for categories
* CRUD action for sub categories
* CRUD action for sub sub categories
* CRUD action for products
* products filtered via category
* simple search for searching through products
* Static main page for displaying products

## App architecture

* `category` has_many `sub_categories`
* `sub_category` has_many `sub_sub_categories`
* `sub_sub_category` has_many `products`

## TODO

* refactor capybara test to test for nested forms
* refactor front-facing navbar loops to be more optimized
* refactor staic homepage controller..
* refactor simple search to scrub lowercase and uppercase data..
* add complex search form with search model

## TESTS

* missed out nested forms tests in sub_category create action
* missed out collection_select tests in sub_category edit action
* missed out testing for filter system @ homepage/static controller action
* TESTS [model & view] categories
* TESTS [model & view] sub categories
* TESTS [model & view] sub sub categories
* TESTS [model & view] products

## Built-with

* Rails 4.2
* Ruby 2.2.2
* rspec 3.0
* capybara
* factorygirl 4.7
* database cleaner
* gritter 1.2.0 - for notifications

## Assignment specs

For this exercise, we will be designing a product catalog.

The product catalog is a customer facing application. A typical customer will browse through several products in a same category and apply some filtering to narrow down their selection.

Build web application with the following specification:

* It stores product information, which involves a product name, description and price in SGD.
* It provides a listing of all products through a UI
An admin interface should be available for configuration of products.
* Create a simple model and respective controller(s) to present the information.
* Do not implement anything related to authentication or product checkout as it is not part of this exercise.

To simplify the setting up process on our end, please use:

* Ruby on Rails ~> 4.2
* PostgreSQL >= 9.3

You are free to use any gems or architectural support as you see fit.

Your solution will be accessed based on the following criteria:

1. Readability. This includes tests that well documents the behavior
2. Performance
3. Modularity and Separation of Concerns
4. Database integrity
5. Please share a link to the git repository with us upon completion.

Happy coding!
