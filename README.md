# repotting-template 🌱🍯

Template & guide for repotting sites as static copies with some optional Ruby testing tools.

Inspired by [Repotting Old Digital Humanities Projects:
Two Test Cases](https://thisismattmiller.com/post/repotting-old-digital-humanities-projects/) by Matt Miller.

<a href="https://thisismattmiller.com/post/repotting-old-digital-humanities-projects/">
  <img alt="illustration borrowed from matt miller's post of three servers including one buried halfway into a plant pot." src="https://i.imgur.com/Uzsl95i.png" width="200"/>
</a>

## Prerequisites

- Wget
- (Optional) Ruby via asdf

## Installation guide

(for Mac; skip anything you already have)

1. Install [homebrew](https://brew.sh/) using the curl command or by downloading the `.pkg` file listed on their website
2. Install wget, asdf, and git
   ```sh
   brew install wget asdf git
   ```
3. Add asdf to your path by running the command listed [here](https://asdf-vm.com/guide/getting-started.html#_3-install-asdf) for your chosen shell & os
4. Install ruby via asdf
   ```sh
   asdf plugin add ruby
   ```

## Instructions

### 1. **Setup**

- [Create a new repo from this template](https://github.com/nyu-dh/repotting-template/generate). The new repo name should be "\<projectname\>-repotted"
- Clone the repo to your local machine and cd into it.
- (Optional) Install specific Ruby version and Ruby gems
  ```sh
  asdf install
  bundle install
  ```

### 2. **Copy**

- Copy the site using the following httrack command. Make sure to replace <url> with thew publically accesible URL you want to copy:
  ```sh
  wget -mpEk --no-parent <url>
  ```

### 3. **Clean up**

- Rename the folder created by the last command (should be the site's url) to `docs`. (Note, this will let you test/host it with GitHub Pages)

### 4. **Spot check**

- Open the `index.html` file in `docs` directly in your browser and poke around. (you can do this with `$ open docs/index.html`) How does it look?

### 5. (Optional) **Programmatically check internal links**

- Run `bundle exec ruby lib/check-links.rb docs`. This will flag any broken links _within_ the site (not externally). Totally up to you what to do with this information / whether or not to fix it!

### 6. (Optional) **Programmatically check html**

- Run `bundle exec ruby lib/check-html.rb docs`. This will flag any HTML errors within the copied site. If there are no major errors, feel free to skip to Step 7.

### 7. (Optional) **Programmatically tidy html**

- Run `bundle exec ruby lib/tidy-html.rb docs`. This will attempt to automatically "tidy" some HTML errors. You can check the HTML again using `$ ruby lib/check-html.rb docs` to see if tidying worked. Again, totally up to you what to do with this information / whether or not to fix it!

### 7. **Finish**

- When you're done copying and tidying, rename this `README.md` file to `instructions.md`
- Next, fill out the `README-template.md` and rename it to `README.md`
- Add, commit, and push your changes (including the site in `docs`)
- Test the site using github pages by going to `settings` > `github pages` and setting the source to `main` > `docs`.
- After a minute, go to the live github pages site to test it.
- If everything is good, copy the contents of `docs` into your "new pot" host, e.g., an NYU web hosting account.
