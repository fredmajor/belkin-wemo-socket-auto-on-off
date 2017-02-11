#!/bin/bash

export PERLBREW_ROOT=/home/alarm/perl5/perlbrew
export PERLBREW_HOME=/home/alarm/.perlbrew
source ${PERLBREW_ROOT}/etc/bashrc


perlbrew use "perl-5.16.0"

perl $HOME/bin/turnAmpOff.pl
