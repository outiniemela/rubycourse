class IsbnValidator
#getteri sekä setteri
	attr_accessor :isbn
#getteri
#	attr_reader :isbn
#setteri
#	attr_writer :isbn

#parametrillinen muodostin
#jos haluaa, että on oletusarvo:
#	def initialize(isbn= '')
	def initialize isbn 
#		puts "initializing" 
		if isbn.nil? 
			@isbn= ""
		else
			@isbn= cleanup_isbn isbn		
		end		
		 	
	end
#getteri, attr_accessor hoitaa molemmat, eli ei siksi tarvitse
#	def isbn
#		return @isbn
#	end
#setteri
#	def isbn=(isbn)
#		@isbn= isbn
#	end
	
	def valid?
		if @isbn.size==10 || @isbn.size==13
			true
		else
			false		
		end
	end
#class-method, joten ei kutsuta new:ta
	def self.valid_character?(c)
		return c==1 || c==2 || c==3 || c==4 ||
			c==5 || c==6 || c==7 || c==8 ||
			c==9 || c==0 || x=='x'
	end

#private-komennon jälkeen olevat luokat toimivat vain, jos niitä kutsutaan ohjelman sisällä
	private
	
	def cleanup_isbn isbn
#		@isbn.downcase.gsub(/-| /, "")
		isbn= isbn.downcase
		isbn= isbn.gsub "-", ""
		isbn= isbn.gsub " ", ""
#		return isbn
#ei tarvitse sanoa return, palauttaa aina viimeisen rivin metodista
		isbn
	end

#saman klassin sisältä ja muista classeista-> protected
	protected
	
end
