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

Note: configure `database.yml` to use the desired database.

## Usage

Visit `http://localhost.com:8080/`

## Development

### Running the specs

```
rspec
```

### Continually run specs

```
guard -c
```