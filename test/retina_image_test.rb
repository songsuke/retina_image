require 'test_helper'

class RetinaImage::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, RetinaImage
  end

  test 'it should return image tag with srcsets' do
    RetinaImage.retina_tag('test.png')
  end
end
