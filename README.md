# Purin

An application to import, via a web UI, purchase data in CSV/TSV format.

Purchase data is expected to:

* must have tab-delimited columns
* must have columns "purchase name, item description, item price, purchase count, merchant address, merchant name" in that order
* must have a header on the first row
* must have data in every cell

## Requirments

* Ruby 2.1.2
* Relational database, e.g. Postgres or MySQL

## Installation

```
git clone git@github.com:krisleech/data-engineering.git
cd data-engineering
bin/setup
rails server
```

The `database.yml` is preconfigured to use an SQLite database.

## Usage

Visit `http://localhost.com:3000/`

### Authentication

The website uses HTTP Authentication, but only the password is read and must
match a token in `AUTH_TOKENS` environment variable.

By default the token is `1234`, see `.env`. If `AUTH_TOKENS` is set to an empty
string then authentication is turned off.

## Development

### Running the specs

```
rspec
```

### Continually running specs

```
guard -c
```

## TODO

* record imports, hashing file content, to prevent re-import of same file
* allow user to see imported data
