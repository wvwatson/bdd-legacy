Behavior Driven Legacy Testing
--------------------------------------------------------
Why would you want to test a legacy system, such as a classic Asp application?  
--------------------------------------------------------
*So that you can modify it safely*
--------------------------------------------------------

Requirements:
  You must have ruby and rubygems

Installation

```
gem install bdd-legacy
```

Then run the bdd-legacy command for your app.  This command will 
create a directory with a cucumber test suite with a number of 
utilities to get you started.

```
bdd-legacy mylegacyapp
```

Edit the env.rb file and point it to your application's domain name and url
``` ruby
# Change this to the domain of your web server.  Don't add the full url
$workingAppHostLink='http://localhost'
# add the url of your login page
$workingAppLoginRoute='/welcome/logon.asp'
```

Change the rest of the defaults if needed
``` ruby
# change to :test or :dev or :local
$currentOpt=:local

#TODO change strings to import from yaml file
#TODO exclude yaml file from check-in
# the below server name will either be in the format of 'MYSERVERNAME' or 'MYSERVERNAME\DATABASEINSTANCE'
# depending on how your sql servr is set up
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

