xml.instruct!

xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1" do
	xml.channel do
		xml.title	"Centro Cultural da Espanha_SP"
		xml.link	root_url
		xml.pubDate @programs.first.created_at.rfc822 if @programs.any?
		#programacao
		@programs.each do |program|
			xml.item do
				xml.title		    "#{program.title}"
				xml.description	program.extract
				xml.link		    "#{root_url}programa/#{program.id}/#{program.permalink}"
				xml.pubDate		  program.created_at.rfc822
				xml.guid		    "#{root_url}programa/#{program.id}/#{program.permalink}"
			end
		end
		#agenda
		@agendas.each do |agenda|
			xml.item do
				xml.title		    "#{agenda.title}"
				xml.description	"#{agenda.when} - #{agenda.where}"
				xml.link		    "#{agenda.url}"
				xml.pubDate		  agenda.created_at.rfc822
				xml.guid		    "#{agenda.url}"
			end
		end
		#midiateca
		@medialibraries.each do |medialibrary|
			xml.item do
			  if medialibrary.title.blank?
			    medialibrary.title = "Midiateca"
		    end
				xml.title		    "#{medialibrary.title}"
				xml.description	"#{medialibrary.description}"
				xml.link		    "#{medialibrary.url}"
				xml.pubDate		  medialibrary.created_at.rfc822
				xml.guid		    "#{medialibrary.url}"
			end
		end
		#notícia
		xml.item do
		  xml.title		    "#{@article.title}"
  		xml.description	"#{@article.subtitle}"
  		xml.link		    "#{root_url}noticia/{@article.permalink}"
  		xml.pubDate		  @article.created_at.rfc822
  		xml.guid		    "#{root_url}noticia/{@article.permalink}"
		end
	end
end