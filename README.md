# RKI Impfungen Daten

## Install

Tested with Ruby 2.7.

 `bundle install`
 `yarn install`
 
 ### Setup cronjob
 
 ## Usage
 
 Download xlsx file with current vacination numbers:
 
 `rake download`

 Extract data from downloaded files:
 
 `rake extract`
 
 Data is extracted as json per file/day and saved to src/_data/impfquoten/
 
 Start website:
 
 `yarn start`
 
 Build website (saved to output/):
 
 `yarn deploy`
