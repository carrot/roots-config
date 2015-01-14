path      = require 'path'
Roots     = require 'roots'

# setup, teardown, and utils

compile_fixture = (fixture_name, done) ->
  @public = path.join(_path, fixture_name, 'public')
  h.project.compile(Roots, fixture_name).then(-> done())

before (done) ->
  h.project.install_dependencies('*').then(-> done())

after ->
  h.project.remove_folders('**/public')

# tests

describe 'development', ->

  before (done) -> compile_fixture.call(@, 'basic', done)

  it 'outputs config local and js tag correctly', ->
    p = path.join(@public, 'index.html')
    p.should.be.a.file()
    p.should.have.content.that.match(/<p>bar<\/p>/)
    p.should.have.content.that.match(/window.config = {"foo":"bar"}/)
