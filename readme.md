Check the balance of your BTC addresses and sum them up

USAGE:
------
$ ruby cs_report.rb

INPUT FILE:
-----------
Create a src folder

Create a csv file with all your btc addresses on one row like so "1JbQQBBYddbQmeYfuaWztYKsBme8AAV1a6","1Aad47AHgZjGedttGFo7LdETJS862BHTfA","12Zzv5TDchY94V8F4WSqyiLvqvnM8V4N2a"

Save this csv input file to the src folder.

OUTPUT FILE:
------------
Each run will create a new version of addresses_with_balance.csv in root folder like so

3 addresses 1JbQQBBYddbQmeYfuaWztYKsBme8AAV1a6,0.0 1Aad47AHgZjGedttGFo7LdETJS862BHTfA,250.0 12Zzv5TDchY94V8F4WSqyiLvqvnM8V4N2a,250.0

TOTAL = 500.0 BTC