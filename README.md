# GitHub Templates

Starter files for GitHub's issue, pull request, and contributing templates
feature; based on popular repositories like Angular.js and Atom.

---

### Adding templates to your project

Simply download the needed files by running this from your root project folder:

```sh
$ bash <(curl -s https://raw.githubusercontent.com/tylucaskelley/github-templates/master/install.sh)
```

### Modifying template files

To fill in your project info, simply run the provided `generate.sh` script
(note that "repository" is the repo name, not the full URL):

```sh
$ bash .github/generate.sh -u username -e email -r repository
```

The only thing left to do is to scroll to the "Code Style" section in
`CONTRIBUTING.md` and add your own guidelines. That's all there is to it! You
may also want to consider deleting the `generate.sh` and `README.md` files to
save some space and remove clutter.
