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

# Script sets up our local energy package
rm(list = ls())
cat("\014")

## Assumes we have $HOME/stochasticresearch/pgraph-r :(
setwd(file.path(path.expand("~"), "stochasticresearch", "pgraph-r"))

## unload any existing loaded energy packages
if(any( grepl("pgraph", (.packages())) )) {
  detach("package:pgraph", unload=TRUE)
}

library(pgraph, lib.loc=".")  ## load our personal pgraph library
library(utils)
