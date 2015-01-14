roots_config = require '../../..'

module.exports =
  ignores: ["**/_*", "**/.DS_Store"]
  extensions: [roots_config(foo: 'bar')]
