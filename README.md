# GitHub Templates

Starter files for GitHub's issue, pull request, and contributing templates
feature; based on popular repositories like Angular.js and Atom.

---

### Adding templates to your project

Use git's submodules feature: first `cd` to your root project folder and then:

```sh
$ git submodule add https://github.com/tylucaskelley/github-templates .github
```

For more on working with submodules, see the
[official docs](https://git-scm.com/book/en/v2/Git-Tools-Submodules)!

### Modifying template files

To fill in your project info, simply run the provided `generate.sh` script (note that "repository" is the repo name, not the full URL):

```sh
$ bash .github/generate.sh -u username -e email -r repository
```

The only thing left to do is to scroll to the "Code Style" section in `CONTRIBUTING.md` and add your own guidelines. That's all there is to it!
