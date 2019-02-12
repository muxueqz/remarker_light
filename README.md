# remarker_light v1.0.0

> [Remark][remark] cli

[remark][remark] is a simple, in-browser, markdown-driven slideshow tool. 

`remarker_light` is a command line tool for building a remark-based slideshow page very easily.

# Usage

Install via nimble:

```console
$ nimble install
```

Write your slide in markdown:

```md
# My Slide

---

# My Slide 2

???

Presenter notes here

---
```

save the above as `slides.md`

Invoke `remarker_light` command.

```console
$ $HOME/.nimble/bin/remarker_light
```

This starts a local server at port 5000 (this is configurable) and you can see your slides at [http://localhost:5000/](http://localhost:5000/).

See remark's [slide](https://remarkjs.com/) and [documentation](https://github.com/gnab/remark#remark) for more details about its syntax, features etc.



## CLI Usage

```
Usage:
  remark_light --file <FILE>
  remark_light --file <FILE> --logo_url <URL>
  remark_light (-h | --help)
  remark_light --version

```

# Examples

- [simple example](https://github.com/kt3k/remarker/tree/master/examples/simple)
- [remark slides](https://github.com/kt3k/remarker/tree/master/examples/remark)
  - The original `remark` slides in `remarker` configuration.

# Motivation of `remarker`

`remark` is a great presentation tool and you can write your slide's contents in markdown. The problem is when you simply use ramark, you need to maintain the html, css and scripts as well as markdown. If you care the details of design and style of the slides, that's fine. However if you don't care the design of the slides that much and want to focus only on the contents, then the settings of css, html, scripts seem quite messy. `remarker` solves this problem. `remarker` separates the contents (= markdown) from the settings (css, html, scripts). So you can only focus on and keep maintaining the contents of the slides and let `remarker` do the rest of the work. This is easier than using `remark` directly.

# How-tos

## How to use images in slides

Put the images under `./assets` directory and they are automatically served/copied and you can reference it like `<img src="assets/my-diagram.png" width="600" />` in your slides.

The directory name of `assets` can be configured in `remarker.yml`. See the configuration section for details.

# License

GPLv2

[remark]: https://github.com/gnab/remark
