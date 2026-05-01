# Return Markdown format of Party Parrots

Return Markdown format of Party Parrots

## Usage

``` r
party_md(parrot, height = 30)
```

## Arguments

- parrot:

  name of parrot(s) gif

- height:

  height of the parrots. Default is 30. Larger may work well for HD
  parrots.

- ...:

  additional arguments to pass to
  [`htmltools::div()`](https://rstudio.github.io/htmltools/reference/builder.html)

## Value

HTML div containing parrots

## Examples

``` r
party_md('parrot')
#>                            parrot 
#> "![](/tmp/Rtmpe31zS7/parrot.gif)" 
party_md(c('parrot', 'sadparrot', 'zimbabweparrot'))
#>                                    parrot 
#>         "![](/tmp/Rtmpe31zS7/parrot.gif)" 
#>                                 sadparrot 
#>      "![](/tmp/Rtmpe31zS7/sadparrot.gif)" 
#>                            zimbabweparrot 
#> "![](/tmp/Rtmpe31zS7/zimbabweparrot.gif)" 
```
