require './spec/spec_helper'

describe Museum do
	let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
	let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
	let(:dead_sea_scroll) {Exhibit.new({name: "Dead Sea Scroll", cost: 10})}
	let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}

	describe '#initialize' do
		it 'exists' do
			expect(dmns).to be_a(Museum)
		end

		it 'has attributes' do
			expect(dmns.name).to eq("Denver Museum of Nature and Science")
			expect(dmns.exhibits).to eq([])
		end
	end

	describe '#add_exhibit' do
		before do
			dmns.add_exhibit(gems_and_minerals)
			dmns.add_exhibit(dead_sea_scroll)
			dmns.add_exhibit(imax)
		end

		it "can add exhibits to its array" do
			expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scroll, imax])
		end
	end
end