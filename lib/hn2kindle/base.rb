module Hn2kindle
	class Base

		def initialize
			
		end

		def retrieve_front_page_news
			url = 'http://api.ihackernews.com/page'
			puts "start to retrieve"
			res = RestClient.get url
			puts "start to parse"
			hash = decode_json(res)
			hash['items']
		end

		def make_mobi_book(url, title)
			puts "start to fetch #{title} from #{url}"
			begin
				filestr = RestClient.get url
			rescue
				puts "fail fetch"
				puts "-------------------------------------"
				return
			end

			puts "-------------------------------------"
			File.open('tmp.html', 'w') {|file| file.write(filestr) }
			titl = "#{title}.mobi".gsub!(/ /, '_')
			Kindlegen.run('tmp.html', '-o', titl)
			File.delete('tmp.html')
			
		end

		def make_mobi_books
			items = retrieve_front_page_news
			items.each do |item|
				make_mobi_book(item['url'], item['title'])
			end
			system('mv *.mobi books/')
		end

	private

		def encode_json(params)
      Yajl::Encoder.encode(params)
    end
    
    def decode_json(response)
      parser = Yajl::Parser.new
      hash = parser.parse(response)
      hash
    end

	end
end