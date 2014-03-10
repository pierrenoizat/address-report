#!/usr/bin/env ruby

require "rubygems"
require 'bundler/setup'
require 'spreadsheet'
require "csv"
require "pry"
require "active_support/all"
require "active_model"
require "mechanize"
require 'terminal-table'
require 'json'
require 'pp'


def relative_path(path)
  File.expand_path(path, File.dirname(__FILE__))
end
 
def address_balance(address)
  @address= address
  string = "#{BASE_URL + @address + "?confirmations=" + CONFIRMATIONS}"
  page = @agent.get string

  @value = (page.body.to_i)/100000000.0 # balance value converted from Satoshis to BTC
  end


  begin
    
  BASE_URL= 'https://blockchain.info/q/addressbalance/'
  CONFIRMATIONS = '6'
  files = Dir.glob(relative_path('src/*.csv')) # csv file in src folder containing all addresses on one row
  @agent = Mechanize.new
  if File.exists?("addresses_with_balance.csv")
    File.delete("addresses_with_balance.csv") # delete any previous version of addresses_with_balance.csv file
    end
    
  rows = [] # rows of the table to be displayed by terminal-table gem
    
  files.each do |file| # start processing files in src folder
    
    address_array = []
    @file_sum = 0
    CSV.foreach(file) do |col|
        col.each do |s|
          address_array << [s]
          end
        end # of read input file
    
    count = address_array.size # number of addresses in source file
    k = 0
  
    puts "#{count.to_s + " addresses"}\n\n"
    
    CSV.open("addresses_with_balance.csv", "ab") do |csv| # output addresses and their balance to addresses_with_balance.csv file
      csv << ["Balance checked as of " + "#{Time.now}"]
      csv << ["#{count.to_s + " addresses"}"]
      while k < count  do
        address_field = address_array[k][0].to_s
        balance = address_balance("#{address_field.to_s}")
        @file_sum = @file_sum + balance
        csv << [address_field, balance.to_s]
        rows << [address_field, balance.to_s]
        unless k == count-1
          rows << :separator
          end
        k+=1
        end

      csv << ["TOTAL = " + @file_sum.to_s + " BTC"]
      
      table = Terminal::Table.new :title => "Cold Storage #{Time.now}", :headings => ['Address', 'BTC Balance'], :rows => rows
      table.align_column(1, :right)
      puts table
      puts "#{"TOTAL = " + @file_sum.to_s + " BTC"}\n\n"
      
      end # of CSV write to addresses_with_balance.csv output file
      
    end # of input file processing
    
  end