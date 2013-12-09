require_relative '../test_helper'

class StoreRakeTest < Minitest::Unit::TestCase

  def setup
    load File.expand_path("../../../lib/tasks/store.rake", __FILE__)
    Progressrus.store = Progressrus::Store::Redis.new
  end

  def test_store_flush_should_flush_the_store
    Progressrus.store.expects(:flush).with('test')
    Rake::Task['progressrus:store:flush'].invoke('test')
  end

end
