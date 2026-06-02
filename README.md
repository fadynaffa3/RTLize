# RTLize

[![Build Status](https://github.com/fadynaffa3/RTLize/actions/workflows/ci.yml/badge.svg)](https://github.com/fadynaffa3/RTLize/actions)

RTLize allows you to write your stylesheets for left-to-right (LTR) layouts and have them automatically work for right-to-left (RTL) layouts as well. It does this by mirroring all the properties and values to their RTL equivalent.

RTLize doesn't depend on any other gem and doesn't tie you down to Rails or any other framework. However, it does work with Rails & Sprockets out of the box, and you can hook it up manually if you use a different stack.

## Requirements

- Ruby >= 4.0.0
- Rails >= 7.0 (optional — works standalone too)
- Sprockets 4.x (when used with Rails)

## Installation

Add it to your Gemfile:

```ruby
gem 'rtlize'
```

Then run:

```bash
bundle install
```

## Using RTLize from the Command Line

Install the gem:

```bash
gem install rtlize
```

Then use the `rtlize` command to flip your LTR stylesheets to RTL (or vice versa):

```bash
rtlize application.css application.rtl.css
```

For help:

```bash
rtlize -h
```

## Using RTLize with Rails

### 1. Create symlinks for your RTL stylesheets

Create symbolic links of your stylesheets with `.css` replaced by `.rtl.css`:

```bash
ln -s sheet1.css sheet1.rtl.css
ln -s sheet2.css.scss sheet2.rtl.css.scss
ln -s sheet3.css.erb sheet3.rtl.css.erb
```

### 2. Declare them in your Sprockets manifest

In `app/assets/config/manifest.js`, explicitly link your RTL assets:

```js
//= link application.css
//= link application.rtl.css
//= link sheet2.css
//= link sheet2.rtl.css
```

### 3. Set the `dir` attribute on your HTML element

```erb
<html lang="<%= I18n.locale %>" dir="<%= Rtlize.dir %>">
```

`Rtlize.dir` returns `'rtl'` when the current locale is in the RTL locales list (`:ar`, `:fa`, `:he`, `:ur` by default), and `'ltr'` otherwise.

Now when you request `sheet1.rtl.css`, you receive an RTLized version of `sheet1.css`.

## Configuration

In `config/application.rb` or an initializer:

```ruby
# Default: "[dir=rtl]"
config.rtlize.rtl_selector = "[dir=rtl]"

# Default: [:ar, :fa, :he, :ur]
config.rtlize.rtl_locales = [:ar, :fa, :he, :ur]
```

## Manually Overriding CSS

RTLize won't transform any CSS rules whose selector contains the `rtl_selector`. Use this to write RTL-specific overrides:

```css
/* This will be transformed: margin becomes "1px 4px 3px 2px" */
.class-1 {
  margin: 1px 2px 3px 4px;
}

/* These will NOT be transformed — they already target RTL */
[dir=rtl] .class-2 { margin-right: 2px; }
[dir="rtl"] .class-3 { margin-right: 3px; }
[dir='rtl'].class-4 { margin-right: 4px; }
```

## Preventing Sections from Being Transformed

Use the `no-rtl` directive to exclude blocks of CSS:

```css
/* This will be transformed */
.top-level-class .child-1 {
  margin-left: 1px;
}

/*!= begin(no-rtl) */
/* This will NOT be transformed */
.top-level-class .child-2 {
  float: left;
}
/*!= end(no-rtl) */

/* This will be transformed again */
.another-class span {
  padding-right: 5px;
}
```

> **Note:** The `!` in the comment is required so CSS compressors don't strip the directive before RTLize sees it. In SCSS/Sass you may need `!!` (e.g. `/*!!= begin(no-rtl) */`). Only use these directives at the top level of your CSS — not inside nested rules.

## Rails Admin

RTLize works with [rails_admin](https://github.com/railsadminteam/rails_admin). Add a symlink for the rails_admin stylesheet and link it in your manifest:

```bash
ln -s rails_admin/application.css rails_admin/application.rtl.css
```

In `app/assets/config/manifest.js`:

```js
//= link rails_admin/application.rtl.css
```

Then in your rails_admin layout or initializer, switch the stylesheet based on locale:

```erb
<html dir="<%= Rtlize.dir %>">
```

## Versioning

This gem follows [Semantic Versioning](https://semver.org).

## Credits

This gem is a continuation of [Marwan Al Jubeh's original RTLize](https://github.com/maljub01/RTLize), which had become outdated and unmaintained. The original commits and history have been preserved. Updated and maintained by [Fady Naffa](https://github.com/fadynaffa3) to support Ruby 4 and Rails 7/8.

RTLize was originally inspired by [Dustin Diaz's R2](https://github.com/ded/R2).

## License

RTLize is released under the [MIT License](MIT-LICENSE).
