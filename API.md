## Global rules

Every request and response is in JSON format (`Content-Type: application/json` header is required).
The structure following the [JSON API specifications](https://jsonapi.org/format/).

## Routes

- [GET /seasons](#get-seasons)
- [GET /movies](#get-movies)

## GET requests

### GET /seasons

**Return the seasons ordered by creation, including the list of episodes ordered by its number.**

Example request:
```
GET /seasons
```

Example response:
```
{
    "data":[{
        "id":"2119",
        "type":"season",
        "attributes":{
            "title":"Jack Kirby'S New Gods",
            "plot":"Vitae eveniet tenetur. Provident distinctio tenetur. Officia hic et.",
            "created_at":"2019-05-23T20:49:23.011Z"
        },
        "relationships":{
            "episodes":{
                "data":[{
                    "id":"2120",
                    "type":"episode"
                },{
                    "id":"2121",
                    "type":"episode"
                }]
            }
        }
    }],
    "included":[{
        "id":"2120",
        "type":"episode",
        "attributes":{
            "title":"It's a Battlefield",
            "plot":"All right, Mr. DeMille, I'm ready for my closeup.",
            "number":4
        }
    },{
        "id":"2121",
        "type":"episode",
        "attributes":{
            "title":"Mother Night",
            "plot":"All right, Mr. DeMille, I'm ready for my closeup.",
            "number":5
        }
    }]
}
```

### GET /movies
**Return the movies ordered by creation.**

Example request:
```
GET /movies
```

Example response:
```
{
    "data":[{
        "id":"1",
        "type":"movie",
        "attributes":{
            "title":"The Cricket on the Hearth",
            "plot":"Vel sapiente velit. Ut odit dolores.",
            "created_at":"2019-05-19T16:00:23.039Z"
        }
    },{
        "id":"2",
        "type":"movie",
        "attributes":{
            "title":"The Skull Beneath the Skin",
            "plot":"Distinctio assumenda exercitationem. Qui aut adipisci.",
            "created_at":"2019-05-19T16:00:23.059Z"
        }
    }]
}
```