Behavior Driven Legacy Testing
===============================

**Why would you want to test a legacy system, such as a classic Asp application?**

One reason would be so that you could modify it safely.  A BDD approach to legacy maintenance also lets 
you rewrite a system piece by piece.  In many instances the *system is the spec*. This means you would do well
to document whatever you touch since you usually own that code afterwards.  BDD provides the best form of
documentation I know of in the form of *executable documentation*.  

*What is the benefit of [executable documentation?](http://www.literateprogramming.com/index.html)*

Well with executable documentation you could [cut and paste it](http://www.literateprogramming.com/quotes_ad.html) 
in an email and send it to a business expert.  This means that there would be less 
opportunity for something to get lost in the translation between your expert's statements 
and the implementation of those statments in code.

Take a look at this example:

``` ruby

Feature: Login
  In order to log into my app
  As my app's personnel
  I want to put in my user name and password
  
  Scenario: Log in
    Given I enter my username
    And I enter my password
    When I press Continue
    Then I should see the environment link 
    And I select the environment link
```

Even without any [further explanation](https://github.com/cucumber/cucumber/wiki/Gherkin), 
(if you know english) you should be able to read and understand the above statements very,
very, easily.  This means your business experts can *at least be able to read* your code.
And yes, that is code.  Therefore, **a feature is executable documentation**


**Requirements**
  
You must have [ruby](http://www.ruby-lang.org/en/downloads/) and [rubygems](http://rubyforge.org/frs/?group_id=126)
This gem is made specifically for use on windows (it uses win32ole).  
The sql server parts will not work on mac or linux.

**Installation**

```
gem install bdd-legacy
```

Then run the bdd-legacy command for your app.  This command will 
create a directory with a cucumber test suite with a number of 
utilities to get you started.

```
bdd-legacy mylegacyapp
```
**Specifiy Url**

Edit the *env.rb* file and point it to your application's domain name and url
Note: this can be a non-local url

``` ruby
#/features/support/env.rb
# Change this to the domain of your web server.  Don't add the full url
$workingAppHostLink='http://localhost'
# add the url of your login page
$workingAppLoginRoute='/welcome/logon.asp'
```

**Specify login steps**

If you have a log in page, edit your the **login_steps.rb** file and change the **fill in** function 
to be the *html* name/id of your username and password **fields** on your log in page

``` ruby
#/features/step_definitions/login_steps.rb
Given /^I enter my username$/ do
    fill_in 'Username', :with => $workingAppUser
end

Given /^I enter my password$/ do
  fill_in 'Password', :with => $workingAppPW
end
```
**Username/Password**

Change the application's user id and password in your *env.rb* file.
These will get put into the fields previously mentioned

``` ruby
#/features/support/env.rb
$workingAppUser='myapplicationusername'
$workingAppPW='myapplicationpw'
```
**Work flow**

Your normal workflow will start with writing a feature with scenarios similar to the following:

```ruby
Feature: Home Page
  In order to work in my app
  As my apps personnel
  I need to land on the home page
  
  Scenario: Land on the hope page
    Given I am logged in
    Then I should see "My Apps greeting"    
    And I should see "Something else that I want to check"
````
The feature relates to something the user wants to be able to do in your application.
The Scenario actually manipulates your application.
If you were to add the above feature into a 'homepage.feature' file you could
then run the following command:

````
cucumber features
````

which would then give you the following output:

``` ruby
Given /^I am logged in to my app$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see something like "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I press Continue$/ do
  pending # express the regexp above with the code you wish you had
end
```

Which you then cut and paste into a step definition file:

``` ruby
```

**Change the rest of the defaults if needed**

``` ruby
# change to :test or :dev or :local
$currentOpt=:local

# the below server name will either be in the format of 'MYSERVERNAME' 
# or 'MYSERVERNAME\DATABASEINSTANCE' depending on how your sql servr is set up
workingDBServerOpt={:dev => 'MYDEVDATABASESERVER',
                    :test => 'MYTESTDATABASESERVER',
                    :local => 'MYLOCALDATABASE'}
workingDBOpt={:dev => 'devdb',
           :test => 'tstdb',
           :local => 'devdb'}
# if you have a list of links after logging in with a single sign on account,
# you may also have a page of separate links for local/dev/test/prod etc           
workingEnvLinkOpt = {:local => 'Welcome',
                    :dev => 'Welcome',
                    :test => 'Welcome'}  
                    
$workingDBServer = workingDBServerOpt[$currentOpt]
$workingDB = workingDBOpt[$currentOpt]
$workingAppUser='myapplicationusername'
$workingAppPW='myapplicationpw'           
$workingDBUser='mydatabaseusername'
$workingDBPW='mydatabasepw'
```

