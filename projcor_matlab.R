#**************************************************************************
#* 
#* Copyright (C) 2016  Kiran Karra <kiran.karra@gmail.com>
#*
#* This program is free software: you can redistribute it and/or modify
#* it under the terms of the GNU General Public License as published by
#* the Free Software Foundation, either version 3 of the License, or
#* (at your option) any later version.
#*
#* This program is distributed in the hope that it will be useful,
#* but WITHOUT ANY WARRANTY; without even the implied warranty of
#* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#* GNU General Public License for more details.
#*
#* You should have received a copy of the GNU General Public License
#* along with this program.  If not, see <http://www.gnu.org/licenses/>.
#**************************************************************************

## A script which calls the projcor functionality of R through the use of CSV
## inputs, mainly a low-tech Matlab interface

# change the directory so we can process
setwd(file.path(path.expand("~"), "stochasticresearch", "pgraph-r"))
source("loadPgraphPackage.R")
library(pracma)

# setup the temporary directory to attempt to be cross-platform compatible
tmpDir <- "C:\\Windows\\Temp";  # assume we have access to this directory .. TODO: warn user of this!
if(strcmp(.Platform$OS.type, "unix")) {
  tmpDir <- "/tmp";
}

# setup input files
inputX <- file.path(tmpDir, "x_projcor.csv")
inputY <- file.path(tmpDir, "y_projcor.csv")
inputZ <- file.path(tmpDir, "z_projcor.csv")

# read the data
dataX <- read.table(inputX, header = FALSE, sep = ",")
dataY <- read.table(inputY, header = FALSE, sep = ",")
dataZ <- read.table(inputZ, header = FALSE, sep = ",")

dataX <- data.matrix(dataX)
dataY <- data.matrix(dataY)
dataZ <- data.matrix(dataZ)

# call the R function
res <- projcor(dataX, dataY, dataZ)

# return the pdcorr value, which is read directly as a system output by Matlab
vval <- res$projcor.statistic

# write the output to a file, for matlab to read
outFile = file.path(tmpDir, "projcor_matlab_output.csv")
write.table(vval, file=outFile, sep = ",", col.names = FALSE, row.names = FALSE, qmethod = "double")
