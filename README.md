# repotting-template
quick and dirty template and guide for repotting live, static-ish sites with httrack and ruby tools for mac

__[WiP]__

<img alt="repotting photo" src="https://images.pexels.com/photos/4503267/pexels-photo-4503267.jpeg?auto=compress&cs=tinysrgb" width="400"/>

## prerequisites
- [homebrew](https://brew.sh/)
- [httrack](https://www.httrack.com/) (install with `$ brew install httrack`)
- [html-tidy](http://www.html-tidy.org/) (install with `$ brew install tidy-html5`)
- [ruby >= 2.4](https://rvm.io/rvm/install)

## instructions
+ __setup__
  - create a new repo from this template. the repo name should be "\<projectname\>-repotted"
  - clone the repo to your local machine + cd into it.
+ __copy__
  - copy the site using httrack. the command is
  `$ httrack --verbose --clean <url> -O src`, where `<url>` is the full, publicly accessible URL to the website you want to copy. `./src` is where the copied site will go.
+ __check html__
  - run `$ ruby lib/check.rb src`
+ __tidy html__
  - run `$ ruby lib/tidy.rb src new-src`
+ __check new html__
  - run `$ ruby lib/check.rb new-src`
+ __finish up__
