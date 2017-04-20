## Functionality

* CRUD action for categories
* CRUD action for sub categories
* CRUD action for sub sub categories
* CRUD action for products
* products filtered via category
* simple search for searching through products
* Static main page for displaying products

## TODO

* refactor capybara test to test for nested forms
* refactor front-facing navbar loops to be more optimized
* refactor staic homepage controller..
* refactor simple search to scrub lowercase and uppercase data..
* add complex search form with search model

## DONE

* x add simple search
* x create sub category controllers / views
* x create sub sub category controllers / views
* x create product controllers / views
* x add cards to cat, sub cat, sub sub cat
* x add categories to nav bar with styling and dropdown menus
* x finish up main page params[:id] filtering with hash generators
* x add bootstrap styling to forms and tables

## TESTS

* missed out nested forms tests in sub_category create action
* missed out collection_select tests in sub_category edit action
* missed out testing for filter system @ homepage/static controller action
