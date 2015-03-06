# Nashville

Nashville is a wrapper and command line interface for querying the [iTunes Store API](http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html).

> Nashville is named after the [eponymous Capital of Country Music (and Tennesee)](http://en.wikipedia.org/wiki/Nashville,_Tennessee), home of [the Grand 'Ole Opry](http://en.wikipedia.org/wiki/Grand_Ole_Opry) and the [Country Music Hall of Fame and Museum](http://en.wikipedia.org/wiki/Country_Music_Hall_of_Fame_and_Museum).

> It's part of a series of world-class command-line utilities for iOS development, which includes [Cupertino](https://github.com/mattt/cupertino) (Apple Dev Center management), [Shenzhen](https://github.com/mattt/shenzhen) (Building & Distribution), [Houston](https://github.com/mattt/houston) (Push Notifications), [Venice](https://github.com/mattt/venice) (In-App Purchase Verification), and [Dubai](https://github.com/mattt/dubai) (Passbook pass generation).

## Installation

    $ gem install nashville

## Usage

```ruby
require 'nashville'

Nashville::Movie.search(director: "Wes Anderson")

Nashville::Music::Artist.search(artist: "Miles Davis", limit: 5)
```

> For more information about parameters and general usage, check out [Apple's documentation for the iTunes Affiliate Search API](http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html).

## Command Line Interface

Nashville also comes with the `its` binary, which allows you to query the iTunes Store from the command line:

    $ its search --help

    Usage: its search QUERY

      Examples:

        # search
        its search "Jamiroquai"

      Options:
        -m, --media MEDIA    The media type to search for
        -e, --entity ENTITY  The type of results to be returned, relative to the specified media type.
        -a, --attribute ATTRIBUTE The attribute to be searched for in the stores, relative to the specified media type.

        --limit LIMIT        The maximum number of results to return.
        --language LANGUAGE  The language, English or Japanese, to use when returning search results.
        -p, --secret SECRET  Use a shared secret for auto-renewable subscription receipts
        -X, --[no-]explicit  Include explicit content in search results.


    $ its search "Blue in Green" --media music --entity song

    50 Results

    +------------------------+---------------------------------------------------------------------------------+
    |                                                 Result 1                                                 |
    +------------------------+---------------------------------------------------------------------------------+
    | artistId               | 44984                                                                           |
    | artistName             | Miles Davis                                                                     |
    | artistViewUrl          | https://itunes.apple.com/us/artist/miles-davis/id44984?uo=4                     |
    | artworkUrl100          | http://a3.mzstatic.com/us/r30/Music/75/d7/9e/mzi.tugmofjx.100x100-75.jpg        |
    | artworkUrl30           | http://a3.mzstatic.com/us/r30/Music/75/d7/9e/mzi.tugmofjx.30x30-50.jpg          |
    | artworkUrl60           | http://a2.mzstatic.com/us/r30/Music/75/d7/9e/mzi.tugmofjx.60x60-50.jpg          |
    | collectionCensoredName | Kind of Blue                                                                    |
    | collectionExplicitness | notExplicit                                                                     |
    | collectionId           | 162322551                                                                       |
    | collectionName         | Kind of Blue                                                                    |
    | collectionPrice        | 9.99                                                                            |
    | collectionViewUrl      | https://itunes.apple.com/us/album/blue-in-green/id162322551?i=162322872&uo=4    |
    | country                | USA                                                                             |
    | currency               | USD                                                                             |
    | discCount              | 1                                                                               |
    | discNumber             | 1                                                                               |
    | kind                   | song                                                                            |
    | previewUrl             | http://a456.phobos.apple.com/us/r1000/090/Music/ca/55/73/mzm.yslzuywm.aac.p.m4a |
    | primaryGenreName       | Jazz                                                                            |
    | radioStationUrl        | https://itunes.apple.com/us/station/idra.162322872                              |
    | releaseDate            | 1997-03-04T08:00:00Z                                                            |
    | trackCensoredName      | Blue In Green                                                                   |
    | trackCount             | 6                                                                               |
    | trackExplicitness      | notExplicit                                                                     |
    | trackId                | 162322872                                                                       |
    | trackName              | Blue In Green                                                                   |
    | trackNumber            | 3                                                                               |
    | trackPrice             | 0.99                                                                            |
    | trackTimeMillis        | 337560                                                                          |
    | trackViewUrl           | https://itunes.apple.com/us/album/blue-in-green/id162322551?i=162322872&uo=4    |
    | wrapperType            | track                                                                           |
    +------------------------+---------------------------------------------------------------------------------+

    ...

## Creator

Mattt Thompson ([@mattt](https://twitter.com/mattt))

## License

Nashville is available under the MIT license. See the LICENSE file for more info.
