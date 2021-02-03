# markdown
Markdown module for V. For now, it uses pure V for parsing markdown files to HTML.

## Usage
```v
module main
import markdown

fn main() {
    text := '# Markdown Rocks!'
    output := markdown.to_html(text)
    println(output) // <h1>Markdown Rocks!</h1>
}
```

## Installation
Install and use markdown module via VPM:
```
v install markdown
```

Or via [vpkg](https://github.com/vpkg-project/vpkg):

```
vpkg get https://github.com/vlang/markdown --global
```

Or through Git:
```
git clone https://github.com/vlang/markdown.git ~/.vmodules/markdown
```

## Contributors
- Ned Palacios ([@nedpals](https://github.com/nedpals))
- Isaiah ([@isaiahpatton](https://github.com/isaiahpatton/))