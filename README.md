# PETDiagnosticsShiny
A ShinyApp depicting the results of the PETDiagnostics Package

Requirements  
- a directory containing the diagnostics result from the PETDiagnostics package.  
- make sure the DATA_DIRECTORY variable in global.R points to your data directory. The results from each database should be in a separate folder below this directory. Note: if you just want to run the app with some example data, please change the DATA_DIRECTORY variable to "exampleData". 

an environment with R, Rstudio and packages installed. To setup your environment with the right versions of packages use renv:
``` r 
install.packages("renv") 
renv::restore()

```

The app can be run by opening app.R and clicking on "Run App" in the top right corner.
