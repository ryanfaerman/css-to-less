fs = require 'fs'
_ = require 'underscore'
winston = require 'winston'
prettyjson = require 'prettyjson'

winston.cli()

sourceFile = 'source.css'

puts = (d) -> console.log prettyjson.render d

fs.readFile sourceFile, 'utf8', (err, data) ->
  throw err if err

  lines = data.split '\n'
  lines = _.map lines, (l) -> return l.trim()
  
  css = lines.join('')
  
  css = css.replace /\/\*+[^\*]*\*+\//, '' 
  css = css.split /[\{\}]/

  rules = {}

  n = 0
  while n < css.length
    selector = css[n]
    properties = css[n+1]
    rules[selector] = properties
    n += 2

  puts rules


