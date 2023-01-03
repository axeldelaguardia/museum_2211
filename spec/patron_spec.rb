require './spec/spec_helper'

describe Patron do
	let(:patron) {Patron.new("Bob", 20)}

	describe '#initialize' do
		it 'exists' do
			expect(patron).to be_a(Patron)
		end

		it 'has attributes' do
			expect(patron.name).to eq("Bob")
			expect(patron.spending_money).to eq(20)
			expect(patron.interests).to eq([])
		end
	end
end