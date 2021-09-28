## Airport Crawler

A simple HTML Parser for grabbing the list of airports available in the [World Airport Codes website](https://www.world-airport-codes.com/)

#### Requirements
- Ruby 2.2 or greater

### How to

#### Download dependencies
```sh
$bundle install
```

#### Run
```sh
$ruby airport_crawler.rb
```

#### Result
It will generate a `.JSON` file with all airports (the ones with IATA code). The file is optimized to get a small size and be embedded in your app (around 700 KB). You can change the code to generate a fancier output if you want.

```js
[
  /* IATA;AirportName;City;Country */
  "ATT;Atmautluak;Atmautluak;United States"
]
```
