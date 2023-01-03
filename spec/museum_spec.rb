require './spec/spec_helper'

describe Museum do
	let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

	let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
	let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
	let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}

	let(:patron_1) {Patron.new("Bob", 20)}
	let(:patron_2) {Patron.new("Sally", 20)}

	before do
		patron_1.add_interests("Dead Sea Scrolls")
		patron_1.add_interests("Gems and Minerals")
		patron_2.add_interests("IMAX")
	end

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
			dmns.add_exhibit(dead_sea_scrolls)
			dmns.add_exhibit(imax)
		end

		it "can add exhibits to its array" do
			expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
		end
	end

	describe '#recommend_exhibits' do
		before do
			dmns.add_exhibit(gems_and_minerals)
			dmns.add_exhibit(dead_sea_scrolls)
			dmns.add_exhibit(imax)
		end

		it 'can recommend exhibits to patrons that match patrons interests' do
			expect(dmns.recommend_exhibits(patron_1)).to eq([gems_and_minerals, dead_sea_scrolls])
			expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
		end
	end
end

describe Museum do
	let(:dmns) {Museum.new("Denver Museum of Nature and Science")}

	let(:gems_and_minerals) {Exhibit.new({name: "Gems and Minerals", cost: 0})}
	let(:dead_sea_scrolls) {Exhibit.new({name: "Dead Sea Scrolls", cost: 10})}
	let(:imax) {Exhibit.new({name: "IMAX", cost: 15})}

	let(:patron_1) {Patron.new("Bob", 0)}
	let(:patron_2) {Patron.new("Sally", 20)}
	let(:patron_3) {Patron.new("Johnny", 5)}

	before do
		dmns.add_exhibit(gems_and_minerals)
		dmns.add_exhibit(dead_sea_scrolls)
		dmns.add_exhibit(imax)

		patron_1.add_interests("Dead Sea Scrolls")
		patron_1.add_interests("Gems and Minerals")
		patron_2.add_interests("Dead Sea Scrolls")
		patron_3.add_interests("Dead Sea Scrolls")
	end

	describe '#admit' do
		it 'can admit patrons to museum' do
			expect(dmns.patrons).to eq([])

			dmns.admit(patron_1)
			dmns.admit(patron_2)
			dmns.admit(patron_3)

			expect(dmns.patrons).to eq([patron_1, patron_2, patron_3])
		end
	end

	describe '#patrons_by_exhibit_interest' do
		it 'can list all admited patrons by exhibit interest' do
			dmns.admit(patron_1)
			dmns.admit(patron_2)
			dmns.admit(patron_3)

			patrons_by_exhibit = {
				gems_and_minerals => [patron_1],
				dead_sea_scrolls => [patron_1, patron_2, patron_3],
				imax => []
			}
			expect(dmns.patrons_by_exhibit_interest).to eq(patrons_by_exhibit)
		end
	end

	describe '#ticket_lottery_contestants' do
		it 'returns array of patrons who dont have enough money but interest in exhibit' do
			dmns.admit(patron_1)
			dmns.admit(patron_2)
			dmns.admit(patron_3)

			expect(dmns.ticket_lottery_contestants(dead_sea_scrolls)).to eq([patron_1, patron_3])
			expect(dmns.ticket_lottery_contestants(gems_and_minerals)).to eq(nil)
		end
	end
end