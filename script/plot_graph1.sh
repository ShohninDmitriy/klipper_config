#!/bin/bash

#####################################################################
### Please set the paths accordingly.                             ###
#####################################################################
### Path to your config folder where you want to store your input shaper files
is_folder=~/klipper_config/input_shaper

#####################################################################
################ !!! DO NOT EDIT BELOW THIS LINE !!! ################
#####################################################################
remove_old() {
  if [ -d $is_folder ]; then
    cd $is_folder
    rm -f raw_data_axis*_old.csv
    rm -f resonances_old.png
    if [ -e raw_data_axis=1.000,1.000.csv ]; then
      mv raw_data_axis=1.000,1.000.csv raw_data_axis=1.000,1.000_old.csv
    fi
    if [ -e raw_data_axis=1.000,-1.000.csv ]; then
    mv raw_data_axis=1.000,-1.000.csv raw_data_axis=1.000,-1.000_old.csv
    fi
    if [ -e resonances.png ]; then
      mv resonances.png resonances_old.png
    fi
  else
    mkdir $is_folder
  fi
}

plot_new() {
  mv /tmp/raw_data_axis=1.000,1.000_*.csv $is_folder/raw_data_axis=1.000,1.000.csv
  mv /tmp/raw_data_axis=1.000,-1.000_*.csv $is_folder/raw_data_axis=1.000,-1.000.csv
  ~/klipper/scripts/graph_accelerometer.py -c $is_folder/raw_data_axis*.csv -o $is_folder/resonances.png
}

remove_old
plot_new