fs = require 'fs'
TransformExtensions = require './transform-stream-extensions'

class TransformExtensionsImplementer extends TransformExtensions
  constructor: (opts) ->
    super opts
  _transform: (chunk, enc, cb) ->
    @push chunk.toString()
    cb?()

resStream = new TransformExtensionsImplementer

resStream.on 'error', (err) ->
  console.log "error caught (that's good!): #{err}"

resStream.on 'pipe', (src) ->
  if src is resStream.src
    console.log "source pipes match!"
  else
    throw new Error "source pipes don't match!"

# this always fails because filenames can't have null bytes
fs.createReadStream('\0').pipe resStream
