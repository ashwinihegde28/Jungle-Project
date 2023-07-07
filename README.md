# Jungle

A mini e-commerce application built with Rails 4.2. Using Stripe to order items and "make payments". Model and Feature testing is done with Rspec. Also using basic http authentication in ruby to secure the "admin" side the site. With successful login admins can create new catagories and products and save them to the database.

## <ins>Added Features</ins>

### User Authentication
* Full User Registration & Authenticaion system, utilizing bcrypt for hashed passwords.

### Admin Controls
* Implemented Admin authentication requirement for all Admin actions.

* Admins have ability to view and create new categories.

* Admins can create new products assigned to newly created categories.

### Store features
* Dynamically added Sold-out badges on out of stock products

* Empty Cart Indicator

* Developed an Order Summary page
* Stripe payment integration
  
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Post connecting to postgresql run `bin/rails db:reset` to create, load and seed db.
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
