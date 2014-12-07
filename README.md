Snozzagram - Instagram clone
========================

## Snozzagram

### Introduction

Snozzagram is a clone of Instagram. It was a challenge assigned to us duing Week 8 of Makers Academy.
Functionality includes making new posts (photo-centric), commenting on posts, and liking posts. Other standard features such as user management (standard and Facebook login) were also included. This was a carry-on project from the Yelp clone which was completed during the same week. The core functionality and structure is quite similar and thus this project was relatively easy to complete. 

### Languages/Platforms/Tools

* Ruby on Rails
* Capybara
* PostgreSQL
* Rspec
* Poltergeist.js
* Paperclip
* ActiveRecord
* Devise and OmniAuth
* CanCan
* Amazon Web Services
* jQuery
* Heroku

### Learning Outcomes

This was the second project/challenge that I completed in Rails, so it was much easier to progress towards a final product. That being said, I wanted to try and test different ways to structure the code (helper functions, and avoiding logic falling towards the front end). As with the Yelp clone, I largely focussed on the back-end of this project, skimping on the front-end design in order to practice creating richer database models and app controllers. The final result is a bare-bones but functional photo upload app which is integrated with Amazon Web Services.


### To-do List
- [ ] CSS and HTML. Wanted to focus on the core Rails framework. App is bare-bones
- [ ] Integrate more login functionality (not just email login).
- [ ] More advanced use of JQuery
- [ ] User profile pages
- [ ] Refactoring. Perhaps using some design patterns to eliminate repetitive code.

### Instructions

The live version of the site is available at [http://snozzagram.herokuapp.com/](http://snozzagram.herokuapp.com/).

Clone the repository:

```
$ git clone git@github.com:snozza/snozzagram.git
```

Change into the directory and bundle install the gems:

```
$ cd snozzagram
$ bundle install
```

Run the tests: 

```
$ rspec
```

Start the rails server and visit http://localhost:3000/: 

```
$ rails s