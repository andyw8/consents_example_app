# User Consents Examples in Rails

This repo demonstrates some approaches to various aspects of handling user consents in a Rails app.

It begins with with some basic cases then move onto more complex situations.

The code for each example is stored in its own directory.
Each example uses its own database, which matches the directory

## Setup

For each example, `cd` into its directory then run:

```
bin/setup
```

To start the app, run:

```
bin/rails s
```
You can then access the registration form at
[http://localhost:3000/registrations/new](http://localhost:3000/registrations/new) 

## 00 Baseline

As a baseline, we begin with an app with no consents.

![](images/00.png)

This was generated by running:

`bin/rails generate registration name:string email:string`

The only addition was validations on the `name` and `email` fields:
[app/models/registration.rb](00_consents_example_app/app/models/registration.rb).

## 01 Implied Consent

The simplest thing we build is an implied consent:

![](images/01.png)

We only want this to be shown when the user is registering, so we hide it when editing an existing registration:

[app/views/registrations/_form.html.erb](01_consents_example_app/app/views/registrations/_form.html.erb)

## 02 Checkbox

![](images/02.png)

First we add the checkbox to the form.

[app/views/registrations/_form.html.erb](02_consents_example_app/app/views/registrations/_form.html.erb#L25-L28)

Next we need to verify that the user checks the checkbox.
We'll make use of Rails built-in `acceptance` validator:

[app/models/registration.rb](02_consents_example_app/app/models/registration.rb#L4)

We also need to update the controller to allow this new parameter to be passed to the model:

[app/controllers/registrations_controller.rb](02_consents_example_app/app/controllers/registrations_controller.rb#L72)
