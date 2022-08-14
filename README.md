# PokéAPI <img src="https://raw.githubusercontent.com/ashbaldry/pokeapi/master/man/figures/logo.png" align="right" width="120"/>

This is an R wrapper for [PokéAPI](https://pokeapi.co/)

## Insatllation

```r
remotes::install_github("ashbaldry/pokeapi")
```

## Using PokéAPI

No authentication is required to access the PokéAPI, therefore we can use simple `GET` calls to get the required data. The following categories are available from the PokéAPI:

- [Berries](https://pokeapi.co/docs/v2#berries-section)
  - Berries
  - Firmness
  - Flavours
- [Contests](https://pokeapi.co/docs/v2#contests-section)
  - Types
  - Effects
  - Super Contest Effects
- [Encounters](https://pokeapi.co/docs/v2#encounters-section)
  - Methods
  - Conditions
  - Condition Values
- [Evolutions](https://pokeapi.co/docs/v2#evolutions-section)
  - Chains
  - Triggers
- [Games](https://pokeapi.co/docs/v2#games-section)
  - Generations
  - Pokédexes
  - Versions
  - Version Groups
- [Items](https://pokeapi.co/docs/v2#items-section)
  - Items
  - Attributes
  - Categories
  - Fling Effects
  - Pockets
- [Locations](https://pokeapi.co/docs/v2#locations-section)
  - Locations
  - Areas
  - Pal Park Areas
  - Regions
- [Machines](https://pokeapi.co/docs/v2#machines-section)
  - Machines
- [Moves](https://pokeapi.co/docs/v2#moves-section)
  - Moves
  - Ailments
  - Battle Styles
  - Categories
  - Damage Classes
  - Learn Methods
  - Targets
- [Pokémon](https://pokeapi.co/docs/v2#pokemon-section)
  - Pokémon
  - Abilities
  - Characteristics
  - Egg Groups
  - Genders
  - Growth Rates
  - Natures
  - Pokéathlon Stats
  - Location Areas
  - Colours
  - Forms
  - Habitats
  - Shapes
  - Species
  - Stats
  - Types
  
Examples:
```r
# Can either use the name
get_berry("rawst")
get_move("thunderbolt")

# Or the relevant ID
get_pokemon(1)
```

### Resource Lists

For each endpoint, there is a resource list, that returns a list of URLS that can be used to pull each resource for the selected API. To make it easier, only the name and ID will be returned, so that they can easily be fed into the individual functions

```r
get_category_ids("pokemon")
```

### Caching

To prevent repeated calls creating unnecessary traffic to the API, caching has been implemented, storing each result in its own file.

```r
# Initial query of the API, data stored in cache
get_pokemon(1)
# Run again to get cached data
get_pokemon(1)
```

If you want to pull from the API every time, then set the system environment variable `R_POKEAPI_CACHE=FALSE`.
