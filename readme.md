Roots Config
============

[![npm](https://badge.fury.io/js/roots-config.svg?style=flat)](http://badge.fury.io/js/roots-config) [![tests](http://img.shields.io/travis/carrot/roots-config/master.svg?style=flat)](https://travis-ci.org/carrot/roots-config) [![dependencies](http://img.shields.io/gemnasium/carrot/roots-config.svg?style=flat)](https://gemnasium.com/carrot/roots-config) [![Coverage Status](https://img.shields.io/coveralls/carrot/roots-config.svg?style=flat)](https://coveralls.io/r/carrot/roots-config?branch=master)

Simple configuration for roots, shared through your html, css, and javascript.

> **Note:** This project is in early development, and versioning is a little different. [Read this](http://markup.im/#q4_cRZ1Q) for more details.

### Installation

- make sure you are in your roots project directory
- `npm install roots-config --save`
- modify your `app.coffee` file to include the extension, as such

  ```coffee
  roots_config = require('roots-config')

  module.exports =
    extensions: [roots_config()]
  ```

### Usage

Roots config is a very basic convenience extension. Often times you will want to store all your project's configuration values in one place, and have them available both to your html as locals and to your javascript. To use roots-config, just add it to the extensions as shown above, and pass it an object containing your config values. These values will automatically be available in your views under the `config` key, and if you use the `config_js` helper, will also be available globally for your javascript to pick up.

For example, you could have this in your app.coffee file:

```coffee
extensions: [roots_config(env: 'development')]
```

Now, in one of your main view templates, you could have this:

```jade
p The current environment is #{config.env}!
!= config_js()
script(src='/js/main.js')
```

So here, you can see that anything we passed to the extension is available on `config`. Now, the `config_js` helper just outputs a script tag that attaches all the config variables to `window.config` as well, so your js can pick them up. With the helper in place, you could do this in your `main.js` file:

```js
console.log(config);
```

...and it would return all your config variables. It's that simple!

### License & Contributing

- Details on the license [can be found here](LICENSE.md)
- Details on running tests and contributing [can be found here](contributing.md)
