# Print a Party Parrot to the Viewer

Print a Party Parrot to the Viewer

## Usage

``` r
party(parrot, ..., height = 30)
```

## Arguments

- parrot:

  name of parrot gif

- ...:

  additional arguments to pass to
  [`htmltools::div()`](https://rstudio.github.io/htmltools/reference/builder.html)

- height:

  height of the parrots. Default is 30. Larger may work well for HD
  parrots.

## Value

HTML version of the parrot

## Examples

``` r
party('parrot')

  

party(c('parrot', 'sadparrot', 'zimbabweparrot'))

  
```
