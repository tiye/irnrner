
createAny = (path, collector) ->
  new Proxy (->),
    get: (target, key, receiver) ->
      createAny path.concat([key]), collector
    set: (target, key, value, receiver) ->
      newPath = path.concat [key]
      collector ['set', newPath, value]
    apply: (target, ctx, args) ->
      collector ['apply', path, args]

edit = (x0, f) ->
  changes = []
  collector = (op) ->
    changes.push op
  draft = createAny [], collector
  f draft

  changes.forEach (x) ->
    console.log JSON.stringify(x)

a0 = {}

edit a0, (a1) ->
  a1.b = []
  a1.c = {a: 1, b:2, c: [3,4]}
  a1.c.b = 3
  a1.c.c.push 4

edit a0, (draftState) ->
  draftState.push({ todo: "Tweet about it" })
  draftState[1].done = true
