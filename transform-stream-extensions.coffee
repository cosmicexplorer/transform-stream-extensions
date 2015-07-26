Transform = require('stream').Transform

# just inherit from this, and call super(opts) at the top of your ctor
module.exports =
class TransformStreamExtensions extends Transform
  constructor: (opts = {}) ->
    if not @ instanceof TransformStreamExtensions
      return new TransformStreamExtensions opts
    else
      Transform.call @, opts

    if not opts.dontPropagateErrors
      cbError = (err) =>
        @emit 'error', err
      @on 'pipe', (src) =>
        src.on 'error', cbError
        @src = src
      @on 'unpipe', (src) =>
        src.removeListener 'error', cbError
        # can only have single pipe source at a time
        @src = undefined
