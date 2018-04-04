
### Irnrner

Playing with ES6 Proxies by learning from Immer.

Running:

```coffee
edit a0, (a1) ->
  a1.b = []
  a1.c = {a: 1, b:2, c: [3,4]}
  a1.c.b = 3
  a1.c.c.push 4
```

Prints:

```js
["set",["b"],[]]
["set",["c"],{"a":1,"b":2,"c":[3,4]}]
["set",["c","b"],3]
["apply",["c","c","push"],[4]]
```

### License

MIT
