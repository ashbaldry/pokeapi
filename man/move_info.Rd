% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/move.R
\encoding{UTF-8}
\name{get_move}
\alias{get_move}
\alias{get_move_ailment}
\alias{get_move_battle_style}
\alias{get_move_category}
\alias{get_move_damage_class}
\alias{get_move_learn_method}
\alias{get_move_target}
\title{Get Location Information}
\usage{
get_move(id)

get_move_ailment(id)

get_move_battle_style(id)

get_move_category(id)

get_move_damage_class(id)

get_move_learn_method(id)

get_move_target(id)
}
\arguments{
\item{id}{Either the numeric ID of the required item from the category,
or the character string of the item}
}
\value{
A named list of all related data to the requested entity
}
\description{
A series of functions that pull Pokémon locations data from the PokéAPI
}
\details{
If you type the wrong name and it's close enough to one of the available
names, then the error message will give you the correct spelling.
}
\examples{
\dontshow{if (interactive()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Character name
get_move("bullet-seed")

# ID
get_move(331)
\dontshow{\}) # examplesIf}
}
\seealso{
\url{https://pokeapi.co/docs/v2#moves-section}
}
