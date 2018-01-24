# GitHub Templates

> Good template for GitHub's ISSUE_TEMPLATE.md, CONTRIBUTING.md, and PULL_REQUEST_TEMPLATE.md files.

---

## Installation

Simply download the needed files by running this from your root project folder:

```sh
$ bash -c "$(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)"
```

What I've done on my own computer is create a git alias to handle this, so I can simply run `git tpl`.
Inside your `~/.gitconfig` file, put this under the `[alias]` section:

```sh
tpl = "!f() { bash -c \"$(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)\"; }; f"
```

Now you can run `git tpl` from a project's base folder to get the needed files!
You'll be prompted for your username, email address, and repository name - you can leave
the defaults if they look correct (inferred from `git config` variables).

## Adding your code style guidelines

You should replace the `{guidelines}` section in CONTRIBUTING.md with your own
code style guidelines after installation.

## Contributing

See [CONTRIBUTING.md](.github/CONTRIBUTING.md).

## License

Copyright (c) 2017-2018 Ty-Lucas Kelley. MIT License.
