# ggcorr: correlation matrixes with ggplot2

This function is part of the [GGally][ggally] package. Install it from CRAN or from GitHub:

    install.packages("GGally", type = "source")
    devtools::install_github("ggally", "ggobi")

[Someone at Stack Overflow][so] suggested plotting correlation matrixes with `ggplot2`. `ggcorr` implements that idea in a style similar to the `corrplot` function of the `arm` package. The examples below uses [NBA statistics][fd] shared by Nathan Yau at Flowing Data.

![](example1.png)
![](example2.png)

[ggally]: https://github.com/ggobi/ggally
[so]: http://stackoverflow.com/questions/12196756/significance-level-added-to-matrix-correlation-heatmap-using-ggplot2
[fd]: http://flowingdata.com/2010/01/21/how-to-make-a-heatmap-a-quick-and-easy-solution/
