class Museum
	attr_reader :name, :exhibits, :patrons

	def initialize(name)
		@name = name
		@exhibits = []
		@patrons = []
	end

	def add_exhibit(exhibit)
		exhibits << exhibit
	end

	def recommend_exhibits(patron)
		exhibits.find_all do |exhibit|
			patron.interests.find do |interest|
				exhibit.name == interest
			end
		end
	end

	def admit(patron)
		patrons << patron
	end

	def patrons_by_exhibit_interest
		patrons_by_exhibit = Hash.new{|k, v| k[v] = []}
		exhibits.each do |exhibit|
			patrons.each do |patron|
				if recommend_exhibits(patron).include?(exhibit)
					patrons_by_exhibit[exhibit] << patron
				else
					patrons_by_exhibit[exhibit]
				end
			end
		end
		patrons_by_exhibit
	end
end