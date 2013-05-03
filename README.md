wintersmith-clean-css
=====================

A [Clean-Css](https://github.com/GoalSmashers/clean-css) plugin for [Wintersmith](https://github.com/jnordberg/wintersmith)

Automatically minify's your websites CSS files when building, ignoring already
minified files (ending in '.min.css') so not to muck up anything that came minified
out-of-the-box.


## Install:

Install globally and add <code>wintersmith-clean-css</code> to your wintersmith config.json.
```
$ npm install wintersmith-clean-css -g
```

Or Locally,
```
$ npm install wintersmith-clean-css
```
Then add add to your <code>./node_modules/wintersmith-clean-css/</code> to your wintersmith config.json like so:

```
{
    "locals": {
        ...
    }
    "plugins": [
       "./node_modules/wintersmith-clean-css/"
    ]
}
```
