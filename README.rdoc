# My Videos
-------

My Videos is a web application that allows user to upload only MP4 videos and play those videos from the browser.

## Installation
-------

Clone this repository

```
git clone git@github.com:annejhetson/my_videos.git
cd my_videos
```

Then run bundle to install all the gems

```
bundle
gem install bundler` if you don't have bundler installed
```

Database creation

```
rake db:create db:migrate db:test:prepare
```

Run rails server

```
rails s
```

Open your browser and visit

http://localhost:3000/

## Test suite

```
bundle exec rspec
```
