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
  
  while rule = css.splice 0, 2
    puts rule

