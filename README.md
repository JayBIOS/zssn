# ZSSN (Zombie Survival Social Network)

> Version: 1.0.0

[![Build Status](https://travis-ci.org/JayBIOS/zssn.svg?branch=master)](https://travis-ci.org/JayBIOS/zssn)

[**Deployed here**](https://api.zssn.jaybios.me/)

## Requirements

* Ruby (2.3.1 used)
* Bundler

## Routes

### Survivors

**POST** `/survivors/` to register a new survivor.
```
{
    "name": "string",
    "age": 0,
    "gender": "string",
    "last_location": "0.0,0.0",
    "inventory": "item:quantity,item:quantity..."
}
```

* name - Name of the survivor.
* age - Age of the survivor.
* gender - Gender of the survivor (can be male or female).
* [last_location] - Latitude and longitude of the last location of the survivor.
* inventory - Items that this survivor holds.

**PUT** `/survivors/` to update a survivor location.
```
{
    "last_location": "0.0,0.0"
}
```

* last_location - New location of the survivor.

**POST** `/survivors/{id}/trade` to trade items.
```
{
    "buyer": 0,
    "offer": "item:quantity,item:quantity...",
    "pick": "item:quantity,item:quantity..."
}
```

* id - Survivor that's receiving the deal.
* buyer - Survivor that's issuing the deal.
* offer - Items that the buyer is offering in exchange.
* pick - Items that the buyer wishes to obtain.

**POST** `/survivors/{id}/report` to report a survivor as infected.
```
{
    "by": 0
}
```

* id - Survivor that's going to be reported as infected.
* by - Survivor that's reporting.

### Reports

**GET** `/reports/infected` the percentage of survivors infected by the virus.

**GET** `/reports/non_infected` the percentage of healthy survivors.

**GET** `/reports/average_resource` the average amount of each kind of resource by survivor.

**GET** `/reports/points_lost` the amount of points lost because of the infected.
