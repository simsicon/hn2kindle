module Hn2kindle
	class Base

		def initialize
			
		end

		def retrieve_front_page_news
			url = 'http://api.ihackernews.com/page'
			res = RestClient.get url
			hash = decode_json(res)
			hash['items']
		end

		def tmp_html(url)
			filestr = RestClient.get 'http://viewtext.org/article?url=http://sferik.github.com/t/'
			File.open('tmp.html', 'w') {|file| file.write(filestr) }
			Kindlegen.run('txt.html', '-o', 'txt.mobi')
			File.delete('tmp.html')
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