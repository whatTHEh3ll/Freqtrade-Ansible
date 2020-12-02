#!/bin/bash
#Replace the following variables to match your own environment
#---------------------
CONFIG=config.json
TIMEFRAMES='15m 1h 4h 6h 12h 1d 1w'
EXCHANGE=binance
#---------------------
echo "starting downloading data"
cd ~/freqtrade/ 
source .env/bin/activate; python3 -m freqtrade download-data -t $TIMEFRAMES --days 9 --exchange $EXCHANGE