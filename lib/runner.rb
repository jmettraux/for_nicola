
# script 2

require 'rubygems'
require 'bundler/setup'

require 'rufus-json/automatic'
require 'ruote'
require 'ruote/storage/fs_storage'


storage = Ruote::FsStorage.new('ruote_test')
worker = Ruote::Worker.new(storage)
worker.context.logger.noisy = true
puts "script 2: running worker..."
worker.run

