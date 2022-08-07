#' PokeAPI Group IDs
#'
#' @format
#' A list of 41 `data.frame`s containing the ID and names of groups where the
#' API allows either a name or ID. Each data.frame contains two columns:
#'
#' \itemize{
#' \item{`id`}{A unique number of the group value}
#' \item{`name`}{The name of the group value}
#' }
#'
#' The groups available are:
#'
#' \itemize{
#' \item{Berries}{berry, berry-firmness, berry-flavor}
#' \item{Contests}{contest-type}
#' \item{Encounters}{encounter-method, encounter-condition, encounter-condition-value}
#' \item{Evolution}{evolution-trigger}
#' \item{Games}{generation, pokedex, version, version-group}
#' \item{Items}{item, item-attribute, item-category, item-fling-effect, item-pocket}
#' \item{Locations}{location, location-area, pal-park-area, region}
#' \item{Moves}{move, move-ailment, move-battle-style, move-category, move-damage-class,
#' move-learn-method, move-target}
#' \item{Pokemon}{egg-group, gender, growth-rate, nature, pokeathlon-stat, pokemon,
#' pokemon-color, pokemon-form, pokemon-habitat, pokemon-shape, pokemon-species,
#' stat, type}
#' }
#'
#' If a category is not in this list, then the API will only accept IDs.
#'
#' @source \url{https://pokeapi.co/}
#' @name pk_ids
NULL
