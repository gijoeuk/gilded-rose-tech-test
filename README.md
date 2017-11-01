# gilded-rose-tech-test

Gilded Rose Kate- Tech Test week 10

User stories
--------------
As a shop owner,
so that I can keep track of my stock,
I want to be able to add stock items to my system

As a shop owner
so that I can manage my produce
I want my programme to recognise produce and know its rate of decay

As a shop owner
so that I can manage my produce
I want my programme to recognise produce and know its rate of maturing

As a shop owner
so that I can manage my produce
I want my programme to recognise produce and manage it's sell by date

As a shop owner
so that I can keep on top of quality
I want my programme to monitor the decline in quality of my produce

As a shop owner
so that I can keep on top of quality
I want my programme to monitor the improvement in quality of my produce

As a shop owner
so that I can update produce daily
I want to update all produce at once

Instructions;
-------------

To use this programme you will firstly need to open IRB in the command line and require './lib/gilded_rose.rb'

You can generate a new item using the command 'item = Item.new("itemname", sell_in as integer, quality as integer)'. Create as many as you want and add to an array.

Create a new instance of gilded rose using 'gildedrose = GildedRose.new(items)'. Be sure to pass in your item as an argument.

Your Item has now been passed into Gilded rose.

Use the command 'gilded_rose.update_quality' on a daily basis to update the quality and sell_in of your item.

Tech
-----------
Ruby gems

gem 'rspec'
gem 'rubocop'
gem 'simplecov', require: false, group: :test
gem 'simplecov-console', require: false, group: :test

Test with RSpec from the command line
