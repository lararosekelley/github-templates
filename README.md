# GitHub Templates

> Good template for GitHub's ISSUE_TEMPLATE.md, CONTRIBUTING.md, and PULL_REQUEST_TEMPLATE.md files.

---

## Installation

Simply download the needed files by running this from your root project folder:

```sh
$ bash -c "$(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)"
```

For convenience, you can create a Git alias in your `~/.gitconfig` file. Under the `[alias]` section, add the following
so you can run `git tpl` to generate your template files:

```sh
tpl = "!f() { bash -c \"$(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)\"; }; f"
```

When you run `git tpl`, you'll be prompted for your username, email address, and repository name - you can leave the
defaults if they look correct (inferred from `git config` variables).

## Adding your code style guidelines

You should replace the `{guidelines}` section in [CONTRIBUTING.md](CONTIRBUTING.md) with your own code style guidelines
after installation.

## Adding your Git workflow

[CONTRIBUTING.md](CONTIRBUTING.md#submitting-pull-requests) assumes a forking / feature-branch workflow for making
contributions to your repository; edit this if your project requires a different flow.

## Contributing

See [CONTRIBUTING.md](.github/CONTRIBUTING.md).

## License

Copyright (c) 2017-2018 Ty-Lucas Kelley. MIT License.
