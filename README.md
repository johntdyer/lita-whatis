# lita-whatis

A user-controlled dictionary plugin for [Lita](https://github.com/jimmycuadra/lita).  Copied from esigler/lita-wtf, mainly because I couldnt use 'wtf' in my chats

## Installation

Add lita-whatis to your Lita instance's Gemfile:

``` ruby
gem "lita-whatis"
```

## Configuration

None

## Usage

Set an entry:

```
lita define foo is something that you want to have defined
> foo is something that you want to have defined
```

Find an entry:

```
lita whatis is foo
> foo is something that you want to have defined
```

## License

[MIT](http://opensource.org/licenses/MIT)
