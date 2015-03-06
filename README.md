# Heroku YO

Use YO as a Heroku deploy hook.

![](http://i.imgur.com/UVTgWGDl.png)

## Installation

First, Go to the [YO Developer Dashboard](http://dev.justyo.co/) and get an API key.

Then, push this button [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy) and enter the API key there to create a new Heroku app.

Finally, go to any other Heroku app for which you wish to receive YOs when they're deployed, and add an HTTP deploy hook pointing to `https://[URL]/yo/[USERNAME]`, where `[URL]` is the URL of the Heroku app you just created, and `[USERNAME]` is the YO username you want to send YOs to, like so:

```shell
heroku addons:add deployhooks:http --url=https://your-yo-heroku-app.herokuapp.com/yo/myusername
```

You'll get a YO whenever the app is deployed.
