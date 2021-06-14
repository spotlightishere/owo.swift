# OwO.swift

Badges go here in one line for the master branch ONLY. Badges can also go in the
header line.

Short description describing the application/library/package. Should briefly
describe what the package does, what technologies are used and other relevant
aspects.

Optional long description can be in paragraphs here.

### Installation

1. Step-by-step installation instructions
2. This section is optional, and can be called `Usage` instead if the package
   is an application
3. If you don't want to use step-by-step instructions, display instructions as a
   console command codeblock instead (do not use both):
    - You can still display commands in step-by-step instructions

```
# Comment line
$ command arg1 arg2
$ another-command

# Remove this codeblock if step-by-step instructions are being used.
```

### Examples

You can display an example here (in a codeblock, with language highlighting
enabled) or you can put examples in a folder. If you're putting examples in a
folder, use this text for this section (remove the quote markup):

> Examples of usage can be found in the `examples/` directory. Optional extra
> comment, e.g. "Set the authentication token for examples using the `TOKEN` env
> variable.".

```js
const Example = require('example');

// Create a new instance of Example with configuration "foo"
const ex = new Example("foo");

// Do something
ex.doSomething().then(() => {
  console.log('finished doing something');
}).catch(err => {
  console.error('failed doing something: ' + err.stack);
  process.exit();
});
```

### Contributing

Pull requests are accepted. Make sure you add test suites for new features and
make sure the code passes the spec (so the build doesn't break). Tests are
automatically run when commits are made in a pull request.

### License

The contents of this repository are licensed under the LICENSE_NAME license. A
copy of the LICENSE_NAME license can be found in [LICENSE](LICENSE).
