# laniakea books

[Zola](https://www.getzola.org/) website for [laniakeabooks.org](https://laniakeabooks.org/).

## Development

* We have two Zola sections (`blog` and `books`).
* In Zola, each section has pages.
* Book pages are expanded as directories with `index.md` inside (note the lack of the underscore prefix).
* For each section we have an `_index.md` which defines their template and their sorting.

To run the development auto-reload server:

```sh
zola serve
```

To build static files:

```sh
zola build
```

## License

MIT
