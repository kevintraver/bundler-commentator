# Bundler::Commentator

> Automatically comment your Gems with descriptions from RubyGems

One simple command turns this:

```ruby
gem 'rails', '4.2.0'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
```

into this:

```ruby
# Ruby on Rails is a full-stack web framework optimized for programmer happiness
# and sustainable productivity. It encourages beautiful code by favoring
# convention over configuration.
gem 'rails', '4.2.0'

# This module allows Ruby programs to interface with the SQLite3
# database engine (http://www.sqlite.org).  You must have the
# SQLite engine installed in order to build this module.
# Note that this module is only compatible with SQLite 3.6.16 or newer.
gem 'sqlite3'

# Sass adapter for the Rails asset pipeline.
gem 'sass-rails', '~> 5.0'
```

## Installation

```bash
> gem install bundler-commentator
```

## Usage

```bash
> bundler-commentator
```

### Exisiting comments
At the moment `bundler-commentator` doesn't remove existing comments, so I would
highly recommend first using [bundler-reorganizer](https://github.com/wireframe/bundler-reorganizer) which organizes and cleans your Gemfile

#### Options
`--gemfile_path "path/to/Gemfile"`
`--output_path "path/to/commented/Gemfile"`

## TODO
* Intelligently truncate *really* long comments
* Ability to leave existing comments
