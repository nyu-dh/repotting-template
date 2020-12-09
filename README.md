# repotting-template
quick and dirty template and guide for repotting live, static-ish sites with httrack and ruby tools for mac

<img alt="repotting photo" src="https://images.pexels.com/photos/4503267/pexels-photo-4503267.jpeg?auto=compress&cs=tinysrgb" width="400"/>

## prerequisites
- [homebrew](https://brew.sh/)
- [httrack](https://www.httrack.com/) (install with `$ brew install httrack`)
- [html-tidy](http://www.html-tidy.org/) (install with `$ brew install tidy-html5`)
- [ruby >= 2.4](https://rvm.io/rvm/install)

## instructions
1. __setup__
  - [create a new repo from this template](https://github.com/nyu-dss/repotting-template/generate). the new repo name should be "\<projectname\>-repotted"
  - clone the repo to your local machine + cd into it.
2. __copy__
  - copy the site using httrack. the command is
  `$ httrack --verbose --clean <url> -O src`, where `<url>` is the full, publicly accessible URL to the website you want to copy. `./src` is where the copied site will go. (Note: do not add trailing slash in URL)
3. __clean up__
  - httrack unfortunately adds extra files and unnecessary hierarchies. To clean it up, open the newly generated `src` directory and delete `hts-cache`, `blackblue.gif`, `fade.gif`, and `index.html`.
  - depending on the structure of your "old pot's" URL, you'll have a series of hierarchical folders mirroring the structure of the URL. (e.g., `www`, `nyu.edu`, `projects`, etc.) find the lowermost folder with all the site files and copy them directly into `./src`. then delete the empty directories left over.
4. __check links__
  - run `$ ruby lib/check-links.rb src`. this will flag any broken links _within_ the site (not externally). totally up to you what to do with this information / whether or not to fix it.
5. __check html__
  - run `$ ruby lib/check-html.rb src`. this will flag any HTML errors within the copied site. if there are no major errors, feel free to skip to step 8.
6. __tidy html__
  - run `$ ruby lib/tidy-html.rb src`. this will attempt to automatically "tidy" some HTML errors.
7. __check html again__
  - run `$ ruby lib/check-html.rb src` to see if tidying worked. totally up to you what to do with this information / whether or not to fix it.
8. __finish__
  - when you're done copying and tidying, rename this `README.md` file to `instructions.md`
  - next, fill out the `README-template.md` and rename it to `README.md`
  - test the site using GitHub pages by going to `Settings` > `GitHub Pages` and setting the source to `main` > `src`.
  - after a minute, go to the live github pages site to test.
  - if everything is good, copy the contents of `src` onto your host, e.g., an NYU web hosting account.
  - et voilà!
