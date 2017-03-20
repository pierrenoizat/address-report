Check the balance of your BTC addresses and sum them up

USAGE:

$ ruby cs_report.rb

INPUT FILE:

Create a src folder
Create a csv file with all your btc addresses on one row like so 1JbQQBBYddbQmeYfuaWztYKsBme8AAV1a6,1Pc76wTHdkkayzXrH7Bv6zbuiGduLFN1Er,1KsUrsXQPr1D9c3Ehq4gud94T2TBZSzQG8

Save this csv input file to the src folder.

OUTPUT FILE:
Each run will create a new version of addresses<em>with</em>balance.csv in root folder like so

3 addresses 
1JbQQBBYddbQmeYfuaWztYKsBme8AAV1a6, 0.0 
1Pc76wTHdkkayzXrH7Bv6zbuiGduLFN1Er, 25.0 
1KsUrsXQPr1D9c3Ehq4gud94T2TBZSzQG8, 25.0

TOTAL = 50.0 BTC
