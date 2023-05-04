# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
To deploy

locally run
```
cap production puma:stop
cap production deploy
```

on the server
in the config directory remove the credentials file

```
rm credentials.yml
```

```
EDITOR=nano rails credentials:edit
```

run these commands
```
systemctl start puma_happeacook_production.service
systemctl enable puma_happeacook_production.service
systemctl status puma_happeacook_production.service
```

refer here:
https://www.matthewhoelter.com/2020/11/10/deploying-ruby-on-rails-for-ubuntu-2004.html
https://webdevchallenges.com/how-to-deploy-a-rails-6-application-with-capistrano
