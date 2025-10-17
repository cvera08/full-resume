<h1 align="center">Carlos Vera Online Resume</h1>

<h4 align="center"><em>The full CV online version.</em></h4>

<h2 align="center">Live Demo</h2>

<p align="center">:point_right: <a href="https://cvera08.github.io/full-resume">online-resume</a> :point_left:</p>

[Demo]: https://cvera08.github.io/full-resume

---
---

### Development

#### Prerequisites

- Ruby version 2.5.0 or higher
- RubyGems
- GCC (GNU Compiler Collection - required for some Ruby gems)
- Make

If you don't have these prerequisites installed, you can follow these steps on macOS:

1. Install Homebrew (if not already installed):
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Ruby Version Manager (RVM):
```bash
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
```

3. Install Ruby through RVM:
```bash
rvm install 2.7
rvm use 2.7 --default
```

### Local Setup

1. Install Jekyll and Bundler:
```bash
gem install jekyll bundler
```

2. Install dependencies:
```bash
bundle install
```

3. Run the development server:
```bash
bundle exec jekyll serve
```

The site will be available at `http://127.0.0.1:4000`

You can stop the server anytime by pressing `Ctrl+C`.