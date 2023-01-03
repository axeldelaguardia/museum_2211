require './spec_helper'


RSpec.describe Exhibit do
  describe '#initialize' do
		it 'exists' do
			expect(exhibit).to be_a(Exhibit)
		end

		it 'has attributes' do
			expect(exhibit.name).to eq('Gems and Minerals')
			expect(exhibit.cost).to eq(0)
		end
  end
end
