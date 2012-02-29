
# script 1

require 'rubygems'
require 'bundler/setup'

require 'rufus-json/automatic'
require 'ruote'
require 'ruote/storage/fs_storage'


engine = Ruote::Engine.new(Ruote::FsStorage.new('ruote_test'))

engine.register_participant '.+' do |workitem|
  puts workitem.params['msg']
end

pdef = Ruote.process_definition do
  sequence do
    participant :alpha, :msg => 'Running alpha'
    participant :beta, :msg => 'Running beta'
  end
end

wfid = engine.launch(pdef)

puts "script 1: launched #{wfid}..."

