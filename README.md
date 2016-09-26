# GitHub Templates

Starter files for GitHub's issue, pull request, and contributing templates
feature; based on popular repositories like Angular.js and Atom.

---

### Adding templates to your project

Simply download the needed files by running this from your root project folder:

```sh
$ bash -c "$(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)"
```

What I've done on my own computer is create a git alias to handle this, so I can simply run `git tpl`.
Inside your `~/.gitconfig` file, put this under the `[alias]` section:

```sh
tpl = "!f() { bash -c \"$(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)\"; }; f"
```

Now you can run `git tpl` from a project folder to get the needed files!
You'll be prompted for your username, email address, and repository name.

The only thing left to do is to scroll to the "Code Style" section in
`CONTRIBUTING.md` and add your own guidelines. That's all there is to it!
You may also want to consider deleting the `generate.sh` and `README.md`
files to save some space and remove clutter.
