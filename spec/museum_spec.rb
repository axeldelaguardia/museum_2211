require './spec/spec_helper'

describe Museum do
	let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

	describe '#initialize' do
		it 'exists' do
			expect(dmns).to be_a(Museum)
		end

		it 'has attributes' do
			expect(dmns.name).to eq("Denver Museum of Nature and Science")
			expect(dmns.exhibits).to eq([])
		end
	end
end