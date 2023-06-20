## Client hooks - `phx-hooks`

- To handle custom client-side JavaScript when an element is added, updated, or removed by the server, a hook object may be provided via `phx-hook`.
- `phx-hook` must point to an object with the following life-cycle callbacks:

  - `mounted` - the element has been added to the DOM and its server LiveView has finished mounting.
  - `beforeUpdate` - the element is about to be updated in the DOM. _Note_: any call here must be synchronous as the operation cannot be deferred or cancelled.
  - `updated` - the element has been updated in the DOM by the server.
  - `destroyed` - the elementhas been removed from the page, either by a parent update, or by the parent being removed entierely.
  - `disconnected` - the element's parent LiveView has disconnected from the server.
  - `reconnected` - the element's parent LiveView has reconnected to the server.

- _Note_: when using hooks outside the context of a LiveView, `mounted` is the only callback invoked, and only those elements on the page at DOM ready wil be tracked. For dynamic tracking of the DOM as elements are added, removed, and updated, a LiveView should be used.
- The above life-cycle callbacks have in-scope access to the following attributes:
  - `el` - attribute referencing the bound DOM node.
  - `liveSocket` - the reference to the underlying `LiveSocket` instance.
  - `pushEvent(event, payload, (reply, ref) => ...)` - method to push an event from the client to the LiveView server.
  - `pushEventTo(selectorOrTarget, event, payload, (reply, ref) => ...)` - method to push targeted events from the client to LiveViews and LiveComponents. It sends the event to the LiveComponent or LiveView the `selectorOrTarget` is defined in, where its value can be either a query selector or an actual DOM element. If the query selector returns more than one element it will send the event to all of them, even if all the elements are in the same LiveComponent or LiveView.
  - `handleEvent(event, (payload) => ...)` - method to handle an event pushed from the server.
  - `upload(name, files)` - method to inject a list of file-like objects into an uploader.
  - `uploadTo(selectorOrTarget, name, files)` - method to inject a list of file-like objects into an uploader. The hook will send the files to the uploader with `name` defined by `allow_upload/3` on the server-side. Dispatching new uploads triggers an input change event which will be sent to the LiveComponent or LiveView the `selectorOrTarget` is defined in, where its value can be either a query selector or an actual DOM element. If the query selector returns more than one live file input, an error will be logged.

**Example**

As an example, the markup for a controlled input for phone-number formatting could be written like this:

```elixir
<input type="text" name="user[phone_number]" id="user-phone-number" phx-hook="PhoneNumber" />
```

Then a hook callback object could be defined and passed to the socket:

```js
let Hooks = {}
Hooks.PhoneNumber = {
  mounted() {
    this.el.addEventListener("input", e => {
      let match = this.el.value.replace(/\D/g, "").match(/^(\d{3})(\d{3})(\d{4})$/)
      if(match) {
        this.el.value = `${match[1]}-${match[2]}-${match[3]}`
      }
    })
  }
}

let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, ...})
...
```

- _Note_: when using `phx-hooks`, a unique DOM ID must always be set.
- For integration with client-side libraries which require a broader access to full DOM management, the `LiveSocket` constructor accepts a `dom` option with an `onBeforeElUpdated` callback. The `fromEl` and `toEl` DOM nodes are passed to the function just before the DOM patch operations occurs in LiveView. This allows external libraries to (re)initialize DOM elements or copy attributes as necessary as LiveView performs its own patch operations. The update operation cannot be cancelled or deferred, and the return value is ignored. For example, the following option could be used to add Alpine.js support to your project:

```js
let liveSocket = new LiveSocket("/live", Socket, {
  ...,
  dom: {
    onBeforeElUpdated(from, to){
      if(from._x_dataStack){ window.Alpine.clone(from, to) }
    }
  },
})
```

### Client-server communication

- A hook can push events to the LiveView by using the `pushEvent` function and receive a reply from the server via a `{:reply, map, socket}` return value.
- The reply payload will be passed to the optional `pushEvent` repsonse callback.
- Communication with the hook from the server can be done by reading data attributes on the hook element or by using `Phoenix.LiveView.push_event/3` on the server and `handleEvent` on the client.
