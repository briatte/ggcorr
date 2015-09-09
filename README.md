# ggcorr: correlation matrixes with ggplot2

![](demo.png)

This repository contains the latest version of the `ggcorr` function, which allows to plot correlation matrixes with [`ggplot2`][ggplot2].

## INSTALL

`ggcorr` is part of the __`GGally`__ package. Install it from CRAN or from GitHub:

```{r}
install.packages("GGally")
devtools::install_github("ggobi/ggally")
```

You can also install `ggcorr` as a standalone function from this repository:

```{r}
source("https://raw.githubusercontent.com/briatte/ggcorr/master/ggcorr.R")
```

# THANKS

- The idea for this function comes from [a Stack Overflow question][so].
- The example shown above uses [NBA statistics][fd] shared by Nathan Yau.
- [Barret Schloerke](https://github.com/schloerke) helps by maintaining the `GGally` package

[ggally]: https://github.com/ggobi/ggally
[ggplot2]: http://ggplot2.org/
[so]: http://stackoverflow.com/questions/12196756/significance-level-added-to-matrix-correlation-heatmap-using-ggplot2
[fd]: http://flowingdata.com/2010/01/21/how-to-make-a-heatmap-a-quick-and-easy-solution/
