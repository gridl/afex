require(devtools)
load_all()

devtools::test()

#require(testthat)
#test_dir("tests/testthat")
#test_package("afex")

test_package("afex", filter = "aov")
test_package("afex", filter = "mixed")

options(error = recover)
options(error = NULL)

#install.packages("afex", dependencies = TRUE)
#devtools::build()
devtools::build_vignettes()
clean_vignettes(pkg = ".")


## Complete documentation including DESCRPTION file is written using roxygen2 and wrapper roxyPackage:
require(roxyPackage)  # install.packages("roxyPackage", repo="http://R.reaktanz.de")

pkg.src.dir <- "."

## Windows
R.libs <- "C:/R/R-devel/library"
# Linux:
R.libs <- "./packages/library"

roxy.package(
	pck.source.dir = pkg.src.dir,
	pck.version = "0.14-1",
	pck.description = data.frame(
		Package = "afex",
		Type = "Package",
		Title = "Analysis of Factorial Experiments",
		AuthorsR = "c(person(given=\"Henrik\", family=\"Singmann\", role=c(\"aut\", \"cre\"), email=\"singmann+afex@gmail.com\"),
        person(given=\"Ben\", family=\"Bolker\", role=c(\"aut\")),
        person(given=\"Jake\", family=\"Westfall\", role=c(\"aut\")),
        person(given=\"Søren\", family=\"Højsgaard\", role=c(\"ctb\")),
        person(given=\"John\", family=\"Fox\", role=c(\"ctb\")),
        person(given=\"Michael A.\", family=\"Lawrence\", role=c(\"ctb\")),
        person(given=\"Ulf\", family=\"Mertens\", role=c(\"ctb\"))
    )",
		Depends = "R (>= 3.0.0), lme4 (>= 1.0.5), reshape2, lsmeans (>= 2.17)",
		Suggests = "ascii, xtable, parallel, plyr, optimx, nloptr, knitr, lattice, multcomp, testthat, mlmRev",
		Imports = "stringr, coin, Matrix, pbkrtest (>= 0.3-6), car",
		Description = "Provides convenience functions for analyzing factorial experiments using ANOVA or mixed models. aov_ez(), aov_car(), and aov_4() allow convenient specification of between, within (i.e., repeated-measures), or mixed between-within (i.e., split-plot) ANOVAs for data in long format (i.e., one observation per row), potentially aggregating multiple observations per individual and cell of the design. mixed() fits mixed models using lme4::lmer() and computes p-values for all effects using either Kenward-Roger approximation for degrees of freedom (LMM only), parametric bootstrap (LMMs and GLMMs), or likelihood ratio tests (LMMs and GLMMs). afex uses type 3 sums of squares as default (imitating commercial statistical software).",
		URL = "http://www.psychologie.uni-freiburg.de/Members/singmann/R/afex",
		License = "GPL (>=3)",
		Encoding = "latin1",
    VignetteBuilder="knitr",
		stringsAsFactors = FALSE),
		actions = c("roxy"),
		R.libs = R.libs, 
		repo.root = tempdir())
#system("rmdir pkg/afex/inst")