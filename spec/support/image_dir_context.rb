RSpec.shared_context('temp image dir', shared_context: :metadata) do
  let(:images_orig) { 'spec/data/galc_volume/images' }

  attr_reader :tmp_root
  attr_reader :tmp_images

  before do
    @tmp_root = Dir.mktmpdir(File.basename(__FILE__, '.rb'))
    allow(Rails.application.config).to receive(:galc_volume_root).and_return(tmp_root)

    @tmp_images = File.join(tmp_root, 'images')
    Dir.mkdir(tmp_images)
  end

  after do
    FileUtils.remove_entry(tmp_root)
  end

end
